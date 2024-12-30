IOSEVKA_GIT=https://github.com/be5invis/Iosevka.git
FONT_NAME=IosevkaCustom
BUILD_DIR=.build
INSTALL_DIR ?= ~/.local/share/fonts

.phony = install

build: $(BUILD_DIR) \
	$(BUILD_DIR)/node_modules \
	$(BUILD_DIR)/private-build-plans.toml
	cd $(BUILD_DIR); npm run build -- ttf::$(FONT_NAME)
	install -m 644 $(BUILD_DIR)/dist/$(FONT_NAME)/TTF/*.ttf dist

install: 
	install -m 644 dist/*.ttf $(INSTALL_DIR)

$(BUILD_DIR) :
	git clone --depth 1 $(IOSEVKA_GIT) $(BUILD_DIR)

$(BUILD_DIR)/node_modules :
	cd $(BUILD_DIR); npm install

$(BUILD_DIR)/private-build-plans.toml : config.toml
	cp $< $@

