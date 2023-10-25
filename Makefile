all:
	stow --verbose --dotfiles --target=$$HOME --restow --adopt */

delete: 
	stow --verbose --target=$$HOME --delete --adopt */
