package Utils;

import java.util.Random;
import java.util.Set;
import java.sql.Date;

/**
 * Created by fengxiangli on 16/4/19.
 */
public class CommonUtils {
    public static int getRandomNorepit(int RandMax,Set<Integer> RepitNums){
        int num=getRandomExcept(RandMax, RepitNums);
        RepitNums.add(num);
        return num;
    }
    public static int getRandomExcept(int RandMax,Set<Integer> ExceptNums) {
        Random rand = new Random();

        while (true) {
            int num = rand.nextInt(RandMax);
            if (ExceptNums.contains(num)) {
                continue;
            } else {
                return num;
            }
        }
    }

    public static int getDateDiffer(Date c1, Date c2){
        java.util.Calendar calst = java.util.Calendar.getInstance();
        java.util.Calendar caled = java.util.Calendar.getInstance();
        calst.setTime(c2);
        caled.setTime(c1);
        //设置时间为0时
        calst.set(java.util.Calendar.HOUR_OF_DAY, 0);
        calst.set(java.util.Calendar.MINUTE, 0);
        calst.set(java.util.Calendar.SECOND, 0);
        caled.set(java.util.Calendar.HOUR_OF_DAY, 0);
        caled.set(java.util.Calendar.MINUTE, 0);
        caled.set(java.util.Calendar.SECOND, 0);
        //得到两个日期相差的天数
        int days = ((int) (caled.getTime().getTime() / 1000) - (int) (calst
                .getTime().getTime() / 1000)) / 3600 / 24;

        return days;
    }
}
