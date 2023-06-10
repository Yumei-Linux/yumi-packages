into_tar_source llvm-16.0.5.src

tar -xf ../llvm-cmake.src.tar.xz                                   &&
tar -xf ../llvm-third-party.src.tar.xz                             &&
sed '/LLVM_COMMON_CMAKE_UTILS/s@../cmake@llvm-cmake.src@'          \
    -i CMakeLists.txt                                              &&
sed '/LLVM_THIRD_PARTY_DIR/s@../third-party@llvm-third-party.src@' \
    -i cmake/modules/HandleLLVMOptions.cmake

tar -xf ../clang-16.0.5.src.tar.xz -C tools &&
mv tools/clang-16.0.5.src tools/clang

tar -xf ../compiler-rt-16.0.5.src.tar.xz -C projects &&
mv projects/compiler-rt-16.0.5.src projects/compiler-rt

grep -rl '#!.*python' | xargs sed -i '1s/python$/python3/'

patch -Np2 -d tools/clang <../clang-16.0.5-enable_default_ssp-1.patch

sed 's/clang_dfsan/& -fno-stack-protector/' \
    -i projects/compiler-rt/test/dfsan/origin_unaligned_memtrans.c

mkdir -pv build ; cd build

CC=gcc CXX=g++ cmake -DCMAKE_INSTALL_PREFIX=/usr \
      -DLLVM_ENABLE_FFI=ON \
      -DCMAKE_BUILD_TYPE=Release \
      -DLLVM_BUILD_LLVM_DYLIB=ON \
      -DLLVM_LINK_LLVM_DYLIB=ON \
      -DLLVM_ENABLE_RTTI=ON \
      -DLLVM_TARGETS_TO_BUILD="host;AMDGPU;BPF" \
      -DLLVM_BINUTILS_INCDIR=/usr/include \
      -DLLVM_INCLUDE_BENCHMARKS=OFF \
      -DCLANG_DEFAULT_PIE_ON_LINUX=ON \
      -Wno-dev -G Ninja ..

ninja && ninja install

cp bin/FileCheck /usr/bin