all:
	stow --verbose --target=$$HOME --restow --adopt --ignore my-* */

delete: 
	stow --verbose --target=$$HOME --delete --adopt */
