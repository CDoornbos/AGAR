//***********************************************************************************************
// Written by Cenna Doornbos.
//
// This file should be place in the "...\Fiji.app\macros" folder.
//
// This tool is used to analyse the peaks plot generated by the Select Lanes Tool.
//***********************************************************************************************




// get the control peak areas
Dialog.createNonBlocking("Image preparation");
Dialog.addMessage("Use the Wand tool to select the control peak from each lane from " +
	"top to bottom, then click OK.");
Dialog.show();
results = GetResults();
rlen = lengthOf(results);
Table.create("Data");
lanes = newArray(rlen);
for (i = 0; i < rlen; i++) {lanes[i] = i+1;}
Table.setColumn("Lane", lanes);
Table.setColumn("Control", results);
run("Clear Results");

// calculate control ratios
ratios = newArray(rlen);
for (i = 0;i < rlen; i++) {
	control_i = Table.get("Control", i);
	control_1 = Table.get("Control", 0);
	ratio = control_i/control_1;
	ratios[i] = ratio;
}
Table.setColumn("Control ratio", ratios);

// get the sample peak areas
bands_n = getNumber("How many bands of the protein(s) or gene(s) of interest are there per lane.", 1);

for (i = 0;i < bands_n; i++) {
	set = i+1;
	Dialog.createNonBlocking("Image preparation");
	Dialog.addMessage("Use the Wand tool to select sample peak " + set +
	" from each lane from top to bottom, then click OK.");
	Dialog.show();
	results = GetResults();
	Table.setColumn("Band of interest " + set, results);
	run("Clear Results");
	close("Results");
}

// calculate band of interest/control ratios
for (i = 0;i < bands_n; i++) {
	set = i+1;
	name = "Band of interest " + set;
	ratios = newArray(rlen);
	for (j = 0;j < rlen; j++) {
		ratio_con = Table.get("Control ratio", j);
		band_j = Table.get(name, j);
		band_1 = Table.get(name, 0);
		ratio = (band_j/band_1)/ratio_con;
		ratios[j] = ratio;
	}
	colname = "Normalized protein/gene " + set + " ratio";
	Table.setColumn(colname, ratios);
}


// functions
	// get the results as an array
	function GetResults(){ 
		results = newArray(nResults());
		for (i = 0; i < nResults(); i++) {
		    result_i = getResult("Area", i);
		    results[i] = result_i;
		}
		return results;
	}