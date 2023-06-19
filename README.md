# Automated Gel Analysis Results (AGAR)
The AGAR toolbar can be Integrated into FIJI to help you quantify your DNA and protein gel bands quickly, efficiently, and robustly.

## Setup AGAR
Setting up AGAR is very simple:

1. Download [FIJI](https://imagej.net/software/fiji/downloads). 
2. Download [toolbar](https://github.com/CDoornbos/AGAR/archive/refs/heads/main.zip) and unzip.
3. Place the *Gel Analysis Tools.txt* file in your **'...\Fiji.app\macros\toolsets'** folder.
4. Place the *PreprocessGelImage.ijm*, *SelectLanes.ijm*, and *AnalyzePeaks.ijm* files in your **'...\Fiji.app\macros'** folder.
5. Start FIJI by running the *.exe* from the folder you downloaded it to in **step 1**.
6. Select the **Gel Analysis Toolbar** by clicking the double arrow on the right.
7. Superb! You're all set to start analyzing your gels.

## How to use AGAR

### Gel preprocessing
1. Open your image.
2. Select the *Gel Preprocessing Tool* on the left of the AGAR toolbar and click the image you want to analyze.
3. Follow the preprocessing steps as indicated by AGAR:

    a. Make your image black and white;

    b. Set the background color to white and bands to black;

    c. Rotate your gel horizontally;

    d. Optimize contrast.

4. Hurray! Your done with preprocessing and can save your image.

### Select lanes
1. Tightly select the area of your gel that contains the lanes, but make sure all your bands are included of course! ;)
2. Choose the *Select Lanes Tool* from the AGAR toolbar and click in the area that you selected in **step 1**.
3. Indicate the total number of lanes inside the selected area, but don't forget to include the empty lanes between your samples!
4. FIJI will check with you if the gel lanes are selected correctly. If not, press **No** and return to **step 1** to reselect your gel area.
5. Next, AGAR will work its magic, and ... abracadabra ... your bands are measured and indicated in the peak plot!

### Quantify peaks
1. Select the *Quantify Peaks Tool* and click on the peak plot
2. Use the *Wand Tracing Tool* from FIJI to click the control peaks. These are from the gel bands that have an equal amount of protein or DNA per lane.
3. Most times you only have one protein or gene of interest you want to quantify. But for those of you that want to be real nerdy and quantify a whole bunch of proteins, you can indicate how many in the next pop-up window.
4. Next, use *Wand Tracing Tool* from **step 2** again to select the peaks of interest. Make sure that these are the same amount as you selected for the control peaks.
5. Yeah! You quantified your gel! Don't forget to save your Data results table, Peak plot, and gel with selected lanes as proof of your amazing work! :)

## Versions
AGAR works with FIJI version 20220330 and ImageJ version 1.53q and newer.

## Contact
If you find an error or if something remains unclear, please make a [Github ticket](https://github.com/CDoornbos/AGAR/issues/new/choose).

## License
AGAR is licensed under the Apache-2.0 license.