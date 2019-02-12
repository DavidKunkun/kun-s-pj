package com.kun.foodsafety.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.google.gson.Gson;
import com.kun.foodsafety.model.Page;
import com.kun.foodsafety.model.Store;
import com.kun.foodsafety.services.StoreServ;

@Controller
@RequestMapping("houtai")
public class StoreCon {
	   @Autowired
       private StoreServ storeServ;
       
	   @RequestMapping("addStore.do")
	   public String addStore(Store store) {
		   storeServ.addStore(store);
		return "selStoreByPage.do";
	   }
	   
	   @RequestMapping("selOneStoreBysId.do")
		public ModelAndView selOneStoreBysId(int sId) {
			
			List<Store> list = storeServ.selOneStoreBysId(sId);
			
			ModelAndView mav = new ModelAndView();
			mav.setViewName("updateStore.jsp");
			mav.addObject("store", list.get(0));
			return mav;
		} 
	   
	   
	   @RequestMapping("selStoreByPage.do")
	   public ModelAndView selStoreByPage(Page pageinfo) {
			pageinfo.setCount(storeServ.selCountStore());
			int cp = pageinfo.getCount()/pageinfo.getPageRow() + ((pageinfo.getCount()%pageinfo.getPageRow()==0)?0:1);
			pageinfo.setCountPage(cp);	
			pageinfo.setStart((pageinfo.getPage()-1)*pageinfo.getPageRow());
			
			List<Store> list = storeServ.selStoreByPage(pageinfo);
			
			ModelAndView mav = new ModelAndView();
			mav.setViewName("showStore.jsp");
			mav.addObject("list", list);
			mav.addObject("pageinfo", pageinfo);
			return mav;
		} 
	   
	   @RequestMapping("selAllStore.do")
		public void selAllStore(HttpServletResponse response) throws IOException {
			response.setCharacterEncoding("utf-8");
			List<Store> list = storeServ.selAllStore();
			//System.out.println(list.get(0).getName());
			Gson g= new Gson(); 
			String stores = g.toJson(list);//把list变成String类型
			PrintWriter pw = response.getWriter();
			pw.write(stores);
			pw.flush();
			pw.close();
			
		}
		
		@RequestMapping("updateStore.do")
		public String updateCompany(Store store) {
			storeServ.updateStoreBysId(store);
			
			return "selStoreByPage.do";
		}
		
		@RequestMapping("delMoreThanOneStore.do")
		public String delMoreThanOneStore(String sIdstr) {
			List<String> list = new ArrayList<String>();
			String strs[] = sIdstr.split(",");
			for(int i=0;i<strs.length;i++) {
				System.out.println(strs[i]);
				list.add(strs[i]);
			}
			Store store = new Store();
			store.setsId_list(list);
			storeServ.delMoreThanOneStore(store);
			
			return "selStoreByPage.do";
		}
		
		
       
}
