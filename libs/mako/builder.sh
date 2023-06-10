into_tar_source Mako-1.2.4
pip3 wheel -w dist --no-build-isolation --no-deps $PWD
pip3 install --no-index --find-links dist --no-cache-dir --no-user Mako