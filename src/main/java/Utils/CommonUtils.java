package Utils;

import java.util.Random;
import java.util.Set;

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
}
