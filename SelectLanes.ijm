//***********************************************************************************************
// Written by Cenna Doornbos.
//
// This file should be place in the "...\Fiji.app\macros" folder.
//
// This tool is used to select and measure the lanes from a gel.
//***********************************************************************************************



//check if an area is selected before running the macro
if (getValue("selection.size")==0) {
	exit("error: Make sure to tightly select the part of the gel where the lanes are before running the tool.");
}

// ask user for the number of lanes
lanes_n = getNumber("Number of lanes", 2);

// crop the selected area and select the lanes
window = getInfo("window.title");
run("Duplicate...", "title=analysis");
selectWindow(window);
run("Crop");
run("Select All");
SelectLanes(lanes_n);

// ask user if the lanes are correct, otherwise run reset
Dialog.create("Image analysis");
Dialog.addRadioButtonGroup("Are the gel lanes correctly selected?", newArray("Yes","No"), 2, 1, "Yes");
Dialog.show();

choice = Dialog.getRadioButton();
if (choice=="No") {
	Dialog.createNonBlocking("Image analysis");
	Dialog.addMessage("Reselect the image so that the gel lanes can be selected correctly and run the Select Lanes tool again.");
	Dialog.show();
	run("Reset");
}

// measure the bands per lane
	// select bands of interest
selectWindow("analysis");
run("Duplicate...", "title=duplicate");
setAutoThreshold("MaxEntropy dark no-reset");
run("Convert to Mask");
run("Erode");
run("Analyze Particles...", "display clear add composite");
selectWindow("analysis");
roiManager("Select", 0);
setBackgroundColor(255, 255, 255);
run("Clear", "slice");
run("Select All");
	// measure the bands
SelectLanes(lanes_n);
run("Plot Lanes");
	//close all remaining analysis windows
close("ROI Manager");
close("Results");
close("duplicate");
close("analysis");




// functions

	// select all gel lanes
	function SelectLanes(n) { 
		getDisplayedArea(x, y, image_w, image_h);
		select_w = image_w/ n;

		for (i = 0;i < n; i++) {
			x = i * select_w;
			makeRectangle(x, 0, select_w, image_h);
			if (i == 0) {
				run("Select First Lane");
			} else {
				run("Select Next Lane");
			}
		}
	}
