package com.guringnae.guildspec;

import java.util.Comparator;

public class SpecComp implements Comparator<SpecDTO>{

	@Override
	public int compare(SpecDTO o1, SpecDTO o2) {
		int c1 = o1.getFloor();
        int c2 = o2.getFloor();
        if (c1 < c2) {
            return 1;
        } else if (c1 > c2) {
            return -1;
        } else { // c1 == c2
            return (String.valueOf(o1.getTime()).compareTo(String.valueOf(o2.getTime())));
        }
	}

}
