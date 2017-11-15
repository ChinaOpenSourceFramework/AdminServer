package com.liqiwei.soft.adminserver.common.util;

import org.springframework.ui.Model;

import com.github.pagehelper.PageInfo;

public class PageViewUtil {
	public static void setViewParam(Model model, PageInfo<?> pageInfo) {
		changeNavigatepageNums(5,pageInfo);
		model.addAttribute("pageInfo", pageInfo);
	}
	
	static void changeNavigatepageNums(int navigatePages,PageInfo<?> pageInfo) {
		int pages=pageInfo.getPages();
    	int[] navigatepageNums;
    	int pageNum = pageInfo.getPageNum();
    	
        //褰撴�婚〉鏁板皬浜庢垨绛変簬瀵艰埅椤电爜鏁版椂
        if (pages <= navigatePages) {
            navigatepageNums = new int[pages];
            for (int i = 0; i < pages; i++) {
                navigatepageNums[i] = i + 1;
            }
        } else { //褰撴�婚〉鏁板ぇ浜庡鑸〉鐮佹暟鏃�
            navigatepageNums = new int[navigatePages];
            int startNum = pageNum - navigatePages / 2;
            int endNum = pageNum + navigatePages / 2;

            if (startNum < 1) {
                startNum = 1;
                //(鏈�鍓峮avigatePages椤�
                for (int i = 0; i < navigatePages; i++) {
                    navigatepageNums[i] = startNum++;
                }
            } else if (endNum > pages) {
                endNum = pages;
                //鏈�鍚巒avigatePages椤�
                for (int i = navigatePages - 1; i >= 0; i--) {
                    navigatepageNums[i] = endNum--;
                }
            } else {
                //鎵�鏈変腑闂撮〉
                for (int i = 0; i < navigatePages; i++) {
                    navigatepageNums[i] = startNum++;
                }
            }
        }
        
        pageInfo.setNavigatepageNums(navigatepageNums);
        
	}
	

}