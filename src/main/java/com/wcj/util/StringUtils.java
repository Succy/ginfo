package com.wcj.util;

/**
 * @author Succy
 * @date 2017-04-03 22:59
 **/

public class StringUtils {
    private StringUtils() {
        throw new AssertionError();
    }

    public static boolean isEmpty(String str) {
        if (str == null || "".equals(str)) {
            return true;
        }
        return false;
    }
}
