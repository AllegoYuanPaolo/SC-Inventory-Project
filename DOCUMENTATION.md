
# Code Documentation for the SC-Inventory COBOL Project

## Modules:
### Primary Modules:
- `addStocks` 
	- (Update);  used for restocking, updating the current stocks with new stocks
	- uses `testSearch`, a modified version of the `searchRecord` code as a search module; returns it as a table
- `searchRecord`
	- (Retrieve); used for searching a specific item in the inventory; supports partial key search 
- `viewInventory`
	- (Retrieve); used for viewing *all* of the inventory records
	- calls on `SafetyStockCheck` to update `restockStatus` every time the inventory is viewed
- `resetInventory`
	- (Create); uses `bin\programs\data\items.txt` as a CSV style file to create a `Inventory.dat` (and INDEXED organization file)
	- uses the following modules:
		- `getDate` - gets and returns the current date and time in  YYYY/MM/DD and HH:MM:SS format as a string
		- `viewInventory`
		- `writeFileCheck` - see utility modules for more details
- `SafetyStockCheck`
	- (Update); used for checking a record's  current stock and sets `restockStatus` into either:
		- a) `Restock: (quantity) (unit of measure)` E.G., `Restock: 250 pieces`
		- b) `Okay`
### Utility Modules
- `getDate`
	-  gets and returns the current date and time in  YYYY/MM/DD and HH:MM:SS format as a string
- `writeFileCheck` 
	- checks the `file status` variable when **writing** to catch the error code and return a descriptive error message before stopping execution
- `openFileCheck`
	-  checks the `file status` variable when **opening a file** to catch the error code and return a descriptive error message before stopping execution

---

## Utility Scripts

- `dev.bat`
	- temporarily adds `bin\scripts\` to the working directory's `PATH` to allow them being called from the project's root folder
	- ```shell
	  dev
	  ```
- `compile.bat`
	- used to compile a `.cbl` file in `src\modules\` into an `.exe` file in `bin\programs\`
	- usage:
	```shell
	compile fileName.cbl
	```
	- add `-run` flag to run after compilation
- `compilemodule.bat`
	- used to compile `.cbl` in `src\modules\` into a `.dll` file in `bin\programs\`
	- usage:
	```shell
	compilemodule fileName.cbl
	```
- `utils.bat`
	- lists the Python utility scripts in `Python Utils\
		- `add.py` - simple addition calculator
		- `string.py`- returns the length of an inputted string
	- ```shell
	  utils
	  ```
- `DebugPath.bat`
	- used to check if the `bin\scripts\` scripts are callable from the root directory
	- ```shell
	  debugpath
	  ```
- `updateDoc.bat`