# cookieclicker :)

<img src="img/perfectCookie.png" width="128">

Download the `.zip` with [this link](https://github.com/plasma4/cookieclicker/archive/refs/heads/main.zip). The original game can be found at http://orteil.dashnet.org/cookieclicker/. Please note that this is an unofficial host of cookieclicker and is not endorsed by Orteil or Playsaurus.

- Normal link: [plasma4.github.io/cookieclicker/](https://plasma4.github.io/cookieclicker/)
- Modded link: [plasma4.github.io/cookieclicker/](https://plasma4.github.io/cookieclicker/modded.html)
- Mobile link: [plasma4.github.io/cookieclicker/](https://plasma4.github.io/cookieclicker/mobile.html)
- To play on a file, extract the files from the `.zip` first and then visit `index.html`/`modded.html`/`mobile.html` depending on what you want.

## Information on mods

When using `index.html`, **mods are disabled**. (In older versions, they would be enabled by default.) This acts identically to the normal version of Cookie Clicker (but without ads; these wouldn't work on a domain not owned by Orteil anyway).

Mod options will **only show up** if you are visiting `modded.html` and **mobile functionality and mods** (not part of the base game, and not leaderboard-valid) will only be available in `mobile.html`. Mobile functionality allows using touchscreen for moving around in the ascend menu and using temple swaps, for example.

This mirror for, errrr, like, educational purpose, either to download for your own offline education or to be played online from http://plasma4.github.io/cookieclicker/ if you cannot "educate" yourself on the original URL. It should also fully work when opened as a `file://`.

This fork uses Cloudflare's API as a gateway to certain dynamic JSON files used in Cookie Clicker; see `getJson` in `main.js` for more details.

Note that `index.html`, `modded.html`, and `mobile.html` have **identical code**; they are only different to prevent users from accidentally selecting the wrong version. You can access from `modded`/`mobile` (without the `.html`) and automatic detection of if mods/mobile features should be enabled will still occur.

## Changes compared to base Cookie Clicker (non-visual, shouldn't impact gameplay)
- Removed ads and tracking (ads wouldn't work anyway)
- Hardcoded `<style>` into HTML, so some mods work properly
- Replaced Cloudflare/Google fonts with local versions
- Changed `getJson` to work (and minimize requests necessary by hardcoding some)
- You customizer uses data URIs

## Modded changes compared to base Cookie Clicker (`modded.html`)
- Added a new button: "Inject script" (in the Options menu)
- Allows basic management of script injection, such as autoloading and deletion management

## Mobile changes compared to modded (`mobile.html`)
- Pantheon/temple minigame allows you to tap to select/change slots
- Ascend menu and some other touch functionality now works, as if using a mouse

### How to update

If the original game updates, here is how you can update the mirror:

#### 1. Fetch all new images :

From the root,

Set up user agent:
* `USER="Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/118.0.0.0 Safari/537.36"`

* `cd img/`
* `wget --user-agent="$USER" --convert-links -O index.html http://orteil.dashnet.org/cookieclicker/img/`
* `grep -v PARENTDIR index.html | grep '\[IMG' | grep -Po 'a href="\K.*?(?=")' | sed 's/\?.*//' > _imglist.txt`
* `wget --user-agent="$USER" -N -i _imglist.txt -B http://orteil.dashnet.org/cookieclicker/img/`

#### 2. Fetch all new sounds :

Similarly, from the root :

* `cd snd/`
* `wget --user-agent="$USER" --convert-links -O index.html http://orteil.dashnet.org/cookieclicker/snd/`
* `grep -v PARENTDIR index.html | grep '\[SND' | grep -Po 'a href="\K.*?(?=")' | sed 's/\?.*//' > _sndlist.txt`
* `wget --user-agent="$USER" -N -i _sndlist.txt -B http://orteil.dashnet.org/cookieclicker/snd/`

#### 3. Fetch all new translations :

Similarly, from the root :

* `cd loc/`
* `wget --user-agent="$USER" --convert-links -O index.html http://orteil.dashnet.org/cookieclicker/loc/`
* `grep -v PARENTDIR index.html | grep '\[TXT' | grep -Po 'a href="\K.*?(?=")' | sed 's/\?.*//' > _loclist.txt`
* `wget --user-agent="$USER" -i _loclist.txt http://orteil.dashnet.org/cookieclicker/loc/`

#### 4. Update `js` and `html` files :

From the root directory :

* Fetch the updated `index.html` file: `wget --user-agent="$USER" -O index.html http://orteil.dashnet.org/cookieclicker/` 
* Fetch the updated `style.css` file: `wget --user-agent="$USER" -O style.css http://orteil.dashnet.org/cookieclicker/style.css`
* Fetch updated `js` files : `wget --user-agent="$USER" -i _jslist.txt -B http://orteil.dashnet.org/cookieclicker/`
* Scan `index.html` for any new `<script src` and also `main.js` for any new local javascript (eg `Game.last.minigameUrl`). If there are new scripts, update the `_jslist.txt` accordingly.
* In `main.js` there is a nonfunctional URL we need to change: 
  * Find `DataDir=window.location.origin+'/data/';`, and change to `DataDir='https://orteil.dashnet.org/data/';`

#### 5. Report update here :)

If you happen to update, please make a pull request for others to benefit, thanks!
