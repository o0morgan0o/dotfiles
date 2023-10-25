all:
	stow --verbose --target=$$HOME --restow --adopt  */

delete: 
	stow --verbose --target=$$HOME --delete --adopt */
