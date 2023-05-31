all:
	git checkout master -- build \
		&& mv build/* . \
		&& git rm -r build \
		&& git add index.* \
		&& git commit -e -v -m "built from master"
