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

all: dist/openchat.tgz dist/openchat.md5

.PHONY: clean

# Zimlet for Zimbra
zimlet/dist/com_zextras_chat_open.zip:
	cd zimlet && make dist/com_zextras_chat_open.zip

build/zimlet/com_zextras_chat_open.zip: zimlet/dist/com_zextras_chat_open.zip
	mkdir -p build/zimlet
	cp zimlet/dist/com_zextras_chat_open.zip build/zimlet/

# Zimbra Extension
extension/lib/zal.jar:
	cd extension && ant download-zal
	
build/extension/zal.jar: extension/lib/zal.jar
	mkdir -p build/extension
	cp extension/lib/zal.jar build/extension/

extension/dist/openchat.jar:
	cd extension && ant

build/extension/openchat.jar: extension/dist/openchat.jar
	mkdir -p build/extension
	cp extension/dist/openchat.jar build/extension/

# Documentation
docs-src/dist/admin-guide.pdf:
	cd docs-src && make dist/admin-guide.pdf DOCUMENT_DRAFT=false

#docs-src/dist/admin-guide:
#	cd docs-src && make dist/admin-guide DOCUMENT_DRAFT=false
 
build/admin-guide.pdf: docs-src/dist/admin-guide.pdf
	mkdir -p build
	cp docs-src/dist/admin-guide.pdf build/

#build/admin-guide: docs-src/dist/admin-guide
#	mkdir -p build/admin-guide
#	cp -r docs-src/dist/admin-guide build/

docs-src/dist/user-guide.pdf:
	cd docs-src && make dist/user-guide.pdf

build/user-guide.pdf: docs-src/dist/user-guide.pdf
	mkdir -p build
	cp docs-src/dist/user-guide.pdf build/

# Project files
build/LICENSE:
	mkdir -p build
	cp LICENSE build/

build/openchat.md5: build/LICENSE \
					build/zimlet/com_zextras_chat_open.zip \
					build/extension/openchat.jar \
					build/extension/zal.jar \
					build/admin-guide.pdf \
					build/user-guide.pdf
	mkdir -p build
	cd build && find . -type f -not -name "openchat.md5" -exec md5sum "{}" + > openchat.md5

dist/openchat.tgz: build/LICENSE \
					build/zimlet/com_zextras_chat_open.zip \
					build/extension/openchat.jar \
					build/extension/zal.jar \
					build/admin-guide.pdf \
					build/user-guide.pdf \
					build/openchat.md5
	mkdir -p build
	mkdir -p dist
	cd build && tar -czvf ../dist/openchat.tgz \
		zimlet/com_zextras_chat_open.zip	\
		extension/openchat.jar \
		extension/zal.jar \
		admin-guide.pdf \
		user-guide.pdf \
		LICENSE \
		openchat.md5 \
		--owner=0 --group=0

dist/openchat.md5: dist/openchat.tgz
	cd dist && md5sum openchat.tgz > openchat.md5

clean:
	rm -f build/LICENSE \
		build/openchat.md5 \
		build/zimlet/com_zextras_chat_open.zip \
		build/extension/openchat.jar \
		build/extension/zal.jar \
		build/admin-guide.pdf \
		build/user-guide.pdf \
		dist/openchat.tgz \
		dist/openchat.md5
	rm -rf build/admin-guide
	cd zimlet && make clean
	cd extension && ant clean
	cd docs-src && make clean
