package util;

import java.util.UUID;

/**
 * Created by LENOVO on 2017/5/15.
 */
public class UUIDUtil {
    public static String getUUID(){
        String uuid = UUID.randomUUID().toString().replaceAll("-", "");
        System.out.println(uuid);
        return uuid;
    }
}
