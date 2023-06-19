//***********************************************************************************************
// Written by Cenna Doornbos.
//
// This file should be place in the "...\Fiji.app\macros" folder.
//
// This tool is used preprocess a DNA or protein gel image before analysis of the gel bands.
//***********************************************************************************************



//check version ImageJ
requires("1.53q")

// Ask user if image is black and white, if not make black and white
Dialog.create("Image preparation");
Dialog.addRadioButtonGroup("Is the image black and white?", newArray("Yes","No"), 2, 1, "Yes");
Dialog.show();
choice = Dialog.getRadioButton()
if (choice=="No") {
	run("Make Composite");
	Property.set("CompositeProjection", "null");
	Stack.setDisplayMode("grayscale");
	window = getInfo("window.title");
	run("Z Project...", "projection=[Max Intensity]");
	close(window);
	selectWindow("MAX_"+window);
	rename(window);
}

// Ask user if image is inverted, if so invert image
Dialog.create("Image preparation");
Dialog.addRadioButtonGroup("What colour is the image background?", newArray("White","Black"), 2, 1, "White");
Dialog.show();
choice = Dialog.getRadioButton();
if (choice=="Black") {
	run("Invert");
}

run("8-bit");

// Ask user if image is rotated, if so rotate image
Dialog.create("Image preparation");
Dialog.addRadioButtonGroup("Are the bands horizontal?", newArray("Yes","No"), 2, 1, "Yes");
Dialog.show();

choice = Dialog.getRadioButton();
if (choice=="No") {
	setTool("angle");
	Dialog.createNonBlocking("Image preparation");
	Dialog.addMessage("Select the angle tool to measure the angle the image needs to be turned. " +
	"Mind that shift can be used to draw horizontal lines. If you measured the angle, press OK.");
	Dialog.show();
	angle = getNumber("Rotation angle", 5.00);
	run("Rotate... ", "angle=" + angle + " grid=1 interpolation=Bilinear");
}

// Ask user if colour balance needs to be adepted, if so adapt colour
Dialog.create("Image preparation");
Dialog.addRadioButtonGroup("Is the image contrast sufficient so that the background is white?", newArray("Yes","No"), 2, 1, "Yes");
Dialog.show();

choice = Dialog.getRadioButton();
if (choice=="No") {
	setTool("rectangle");
	Dialog.createNonBlocking("Image preparation");
	Dialog.addMessage("Select part of the image background for correction and press OK.");
	Dialog.show();
	getStatistics(area, mean, min, max, std, histogram);
	run("Select All");
	setMinAndMax(0, max);
}

Dialog.create("Image preparation");
Dialog.addMessage("Image preprocessing is done");
Dialog.show();
setTool("rectangle");