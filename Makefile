all:
	stow --verbose --target=$$HOME --restow --adopt my-* */

delete: 
	stow --verbose --target=$$HOME --delete --adopt */
