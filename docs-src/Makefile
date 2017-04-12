#
# Copyright (C) 2017 ZeXtras S.r.l.
#
# This program is free software; you can redistribute it and/or
# modify it under the terms of the GNU General Public License
# as published by the Free Software Foundation, version 2 of
# the License.
#
# This program is distributed in the hope that it will be useful,
# but WITHOUT ANY WARRANTY; without even the implied warranty of
# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
# GNU General Public License for more details.
#
# You should have received a copy of the GNU General Public License.
# If not, see <http://www.gnu.org/licenses/>.
#

all: dist/admin-guide.pdf dist/user-guide.pdf

.PHONY: clean

build/admin-guide.pdf:
	mkdir -p build
	pdflatex -output-directory=build admin-guide.tex
	pdflatex -output-directory=build admin-guide.tex

dist/admin-guide.pdf: build/admin-guide.pdf
	mkdir -p dist
	cp build/admin-guide.pdf dist/admin-guide.pdf

build/user-guide.pdf:
	mkdir -p build
	pdflatex -output-directory=build user-guide.tex
	pdflatex -output-directory=build user-guide.tex

dist/user-guide.pdf: build/user-guide.pdf
	mkdir -p dist
	cp build/user-guide.pdf dist/user-guide.pdf

clean:
	rm -f build/admin-guide.aux \
		build/admin-guide.log \
		build/admin-guide.out \
		build/admin-guide.pdf \
		build/admin-guide.ptc \
		build/admin-guide.toc \
		dist/admin-guide.pdf \
		build/user-guide.aux \
		build/user-guide.log \
		build/user-guide.out \
		build/user-guide.pdf \
		build/user-guide.ptc \
		build/user-guide.toc \
		dist/user-guide.pdf
