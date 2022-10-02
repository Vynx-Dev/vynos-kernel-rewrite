# The VynOS Kernel rewrite
buggy unstable kernel rewrite, im not gonna fill this readme with text rn im lazy so just run the file run.sh using the command `./run.sh` you need qemu and nasm someone please make this a better readme
# Updates
* ~we got some keyboard input now, but you can only type 33 characters~ it broke, so now no input .-.
* we got github actions so now i dont have to keep on spamming nasm and qemu with commands and my laptop can have a lil rest (yes im compiling and building and committing files all on a slow laptop because my main pc is running windows and i need linux for this)
# Bugs and other stuff
so apparently when you type something, if you hit enter (before you hit the limit of characters) the characters you type after pressing enter will overwrite the text you already typed before you hit enter (it will also overwrite the > text) this might be a bug, but i like it so im gonna keep it in there (unless someone decides to make a PR fixing that bug)

~when you go in releases, it just says update blank.yml so you might think there are no changes, but its github actions being dumb and most likely there is a change in the code with that release~ this should be fixed now
