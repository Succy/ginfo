package com.wcj.test;

import com.wcj.util.Constant;
import com.wcj.util.EncryptorUtils;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.junit.runners.JUnit4;

/**
 * @author Succy
 * @date 2017-04-04 11:43
 **/
@RunWith(JUnit4.class)
public class EncryptorTest {
    @Test
    public void testMd5() {
        String str = "123456";
        String md5 = EncryptorUtils.md5(Constant.SALT, str);
        System.out.println(md5);
    }
}
