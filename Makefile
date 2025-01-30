.PHONY: help add clone update init sync status log remove clean

# vars
JAVA_HOME ?= $(shell /usr/libexec/java_home -v 17 2>/dev/null)
SUBMODULE_PATH = app/src/main/assets/www/  # Change this to your submodule path
SUBMODULE_URL = https://github.com/infinite-happiness/Ananda-Marga-Fasting-Calendar.git  # Change to the actual submodule repo
BRANCH = main

check:  ## check java version
	@java -version 2>&1 | grep "17\." || (echo "ERROR: Must use Java 17!"; exit 1)

debug: check  ## Make debug APK
	./gradlew assembleDebug

release: check  ## Make release APK (required env vars: KEYSTORE, STORE_PASSWORD, KEY_PASSWORD, KEY_ALIAS)
	./gradlew assembleRelease

install:  ## install APK on connected android device
	adb install app/build/outputs/apk/release/ananda-marga-fasting-release.apk

add:  ## Add a new submodule to the repository
	git submodule add $(SUBMODULE_URL) $(SUBMODULE_PATH)

clone:  ## Clone the main repository and initialize all submodules
	git clone --recurse-submodules $(shell git config --get remote.origin.url)

push-gl:
	git push gl-android android:android

init:  ## Initialize submodules (run after cloning if not using --recurse-submodules)
	git submodule init

update:  ## Update all submodules to the latest commit from their respective remote branches
	git submodule update --recursive --remote

sync:  ## Sync submodule configuration with .gitmodules (useful after modifying submodule URLs)
	git submodule sync

status:  ## Show the current status of all submodules
	git submodule status

log:  ## Show the commit history of submodules
	git log --oneline --graph --decorate --all
	#git log --oneline --graph --decorate --all -- $(SUBMODULE_PATH)


remove:  ## Remove a submodule completely
	git submodule deinit -f $(SUBMODULE_PATH)
	git rm -rf $(SUBMODULE_PATH)
	rm -rf .git/modules/$(SUBMODULE_PATH)
	git commit -m "Removed submodule $(SUBMODULE_PATH)"

clean:  ## Clean and reset submodules (useful if submodule is in a bad state)
	git submodule deinit -f --all
	rm -rf .git/modules/*
	git submodule init
	git submodule update --remote --merge

help:  ## Show this help message
	@awk 'BEGIN {FS = ":.*##"} /^[a-zA-Z0-9_-]+:.*##/ {printf "\033[36m%-20s\033[0m %s\n", $$1, $$2}' $(MAKEFILE_LIST)
