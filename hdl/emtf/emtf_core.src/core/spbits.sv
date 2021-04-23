// segments per chamber
`localpar seg_ch = 2;
	
// bit widths of ph and th outputs, reduced precision
// have to be derived from pattern width on top level
`localpar bw_ph = 8;
`localpar bw_th = 7;

// bit widths of ph and th, full precision
`localpar bw_fph = 13;
`localpar bw_fth = 8;

// wiregroup input bit width (0..111)
`localpar bw_wg  = 7;

// bit width of dblstrip input (max 80 for ME234/1 with double-width strips)
`localpar bw_ds  = 7;
// width of halfstrip input
`localpar bw_hs  = 8;

// pattern half-width for stations 3,4
`localpar pat_w_st3 = 3;//4;
	// pattern half-width for station 1
	`localpar pat_w_st1 = pat_w_st3 + 1; 
	// number of input bits for stations 3,4
	`localpar full_pat_w_st3 = (1 << (pat_w_st3+1)) - 1;
	// number of input bits for st 1
	`localpar full_pat_w_st1 = (1 << (pat_w_st1+1)) - 1;
	// width of zero padding for station copies
	`localpar padding_w_st1 = full_pat_w_st1 / 2;
	`localpar padding_w_st3 = full_pat_w_st3 / 2;
	// full pattern widths (aka reduced pattern)
	`localpar red_pat_w_st3 = pat_w_st3 * 2 + 1;
	`localpar red_pat_w_st1 = pat_w_st1 * 2 + 1;

	// number of folds for pattern detectors, do not set to 1
	`localpar fold = 4;
// number of th outputs for ME1/1
`localpar th_ch11 = seg_ch*seg_ch;
`localpar bw_q = 4;
`localpar bw_addr = 7;

// strips per section, calculated so ph pattern would cover +/- 8 deg in st 1
`localpar ph_raw_w = 160; // this is determined by chamber coverage in zones.sv
// should also be divisible by 2

// max possible drifttime
`localpar max_drift = 3;

// bit widths of precise phi and eta outputs
`localpar bw_phi = 12;
`localpar bw_eta = 7;
// width of ph raw hits, max coverage +8 to cover possible chamber displacement 
`localpar ph_hit_w = 40+4;//80 + 8;

	// for 20 deg chambers
	`localpar ph_hit_w20 = ph_hit_w;
	// for 10 deg chambers
`localpar ph_hit_w10 = 20+4;//40 + 8;  
    
// width of th raw hits, max coverage +8 to cover possible chamber displacement 
`localpar th_hit_w = 56 + 8;

//	`localpar endcap = 1;
	`param station = 1;
	`param cscid = 1;

	`localpar n_strips = (station <= 1 && (cscid <= 2 || cscid == 12))                  ? 64 : // ME1/1
						 (station <= 1 && ((cscid >= 6 && cscid <= 8) || cscid == 14) ) ? 64 : // ME1/3 
						 80; // all others
						 
//	`localpar n_wg = (station <= 1 && cscid <= 3) ? 48  : // ME1/1
//					 (station <= 1 && cscid >= 6) ? 32  : // ME1/3
//					 (station == 2 && cscid <= 3) ? 112 : // ME2/1
//					 (station >= 3 && cscid <= 3) ? 96  : // ME34/1 
//					 64; // all others

//	// theta range (take +1 because th_coverage contains max th value starting from 0)
//	`localpar th_coverage = 
//						 (station <= 1 && cscid <= 2) ? 45  : // ME1/1
//						 (station <= 1 && cscid >= 6) ? 27  : // ME1/3
//						 (station <= 1 && cscid >= 3) ? 39  : // ME2/3
//						 (station == 2 && cscid <= 2) ? 43  : // ME2/1
//						 (station == 2 && cscid >= 3) ? 56  : // ME2/2
//						 (station == 3 && cscid <= 2) ? 34  : // ME3/1
//						 (station == 3 && cscid >= 3) ? 52  : // ME3/2
//						 (station == 4 && cscid <= 2) ? 28  : // ME4/1
//						 (station == 4 && cscid >= 3) ? 50  : // ME4/2 
//						 0;

	// phi range
	`localpar ph_coverage =
						   (station <= 1 && ((cscid >= 6 && cscid <= 8) || cscid == 14)) ? 15 : // ME1/3 
						   (station >= 2 && (cscid <= 2 || cscid == 9)) ? 40 : // ME234/1
						   20; // all others
	
	// number of th outputs takes ME1/1 th duplication into account
	`localpar th_ch = (station <= 1 && (cscid <= 2 || cscid == 12)) ? (seg_ch*seg_ch) : // ME1/1 
	                                                       seg_ch; // all others

	// is this chamber mounted in reverse direction?
//	`localpar ph_reverse = (endcap == 1 && station >= 3) ? 1 : 
//			   			   (endcap == 2 && station <  3) ? 1 : 0;

	`localpar th_mem_sz = (1 << bw_addr);
	`localpar th_corr_mem_sz = (1 << bw_addr);

	// multiplier bit width (phi + factor)
	`localpar mult_bw = bw_fph + 11;

	// ph zone boundaries for chambers that cover more than one zone
	// hardcoded boundaries must match boundaries in ph_th_match module
	`localpar ph_zone_bnd1 =
							(station <= 1 && (cscid <= 2 || cscid == 12)) ? 41 : // ME1/1
							(station == 2 && (cscid <= 2 || cscid == 9)) ? 41 : // ME2/1
							(station == 2 && ((cscid >= 3 && cscid <= 8) || cscid == 10)) ? 87 : // ME2/2
							(station == 3 && ((cscid >= 3 && cscid <= 8) || cscid == 10)) ? 49 : // ME3/2
							(station == 4 && ((cscid >= 3 && cscid <= 8) || cscid == 10)) ? 49 : // ME4/2 
							127;
						   
	`localpar ph_zone_bnd2 =
							(station == 3 && ((cscid >= 3 && cscid <= 8) || cscid == 10)) ? 87 : // ME3/2 
							127;

	`localpar zone_overlap = 2;

// sorter parameters
	`localpar bwr = 6; // rank width
	`localpar bpow = 7; // (1 << bpow) is count of input ranks
	`localpar cnr = (1 << bpow); // internal rank count
	`localpar cnrex = ph_raw_w; // actual input rank count, must be even

