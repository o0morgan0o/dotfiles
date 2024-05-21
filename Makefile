.PHONY: desktop laptop delete

delete: 
	cd shared && stow --verbose --target=$$HOME --delete --adopt */
	cd desktop && stow --verbose --target=$$HOME --delete --adopt */
	cd laptop && stow --verbose --target=$$HOME --delete --adopt */

desktop:
	cd shared && stow --no-folding --verbose --target=$$HOME --restow --adopt */
	cd desktop && stow --no-folding --verbose --target=$$HOME --restow --adopt */

laptop:
	cd shared && stow --no-folding --verbose --target=$$HOME --restow --adopt */
	cd laptop && stow --no-folding --verbose --target=$$HOME --restow --adopt */
