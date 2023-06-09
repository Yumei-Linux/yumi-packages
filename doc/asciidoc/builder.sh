into_tar_source asciidoc-10.2.0
pip3 wheel -w dist --no-build-isolation --no-deps $PWD
pip3 install --no-index --find-links dist --no-cache-dir --no-user asciidoc