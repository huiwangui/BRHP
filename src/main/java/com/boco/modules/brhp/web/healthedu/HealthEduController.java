package com.boco.modules.brhp.web.healthedu;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.List;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.boco.common.persistence.Page;
import com.boco.common.utils.JsonUtils;
import com.boco.modules.brhp.service.HealthEduService;
import com.boco.modules.brhp.vo.HealthEduArticleVo;



@Controller
@RequestMapping(value = "/healthEdu", produces = "application/json;charset=UTF-8")
public class HealthEduController {
	
	@Resource
	HealthEduService healthEduService;
	
	/**跳转页面 */
	@RequestMapping(value = "/home", method = RequestMethod.GET)
	public String healHome(HttpServletRequest request, Model model, HealthEduArticleVo vo){
		 //TOP10,
		 List<HealthEduArticleVo> hvoListTop10=	healthEduService.getArticleList(vo);
		 //图片轮播,查询几条数据，并返回数据
		 Page<HealthEduArticleVo> page=new Page<HealthEduArticleVo>(1,1);
		 vo.setPage(page);
		 vo.setModuleId(1);
		 List<HealthEduArticleVo> hvoList1=	healthEduService.getArticleList(vo);
		 //设置图片地址
		 for (HealthEduArticleVo healthEduArticleVo : hvoList1) {
			String strimgs= healthEduArticleVo.getContent();
		    String imgSrc=this.getImgSrc(strimgs).get(0);
			 healthEduArticleVo.setImgSrc(imgSrc);
		 }
		 model.addAttribute("hvoListhome", hvoList1);
		 model.addAttribute("hvoListJson",JsonUtils.getJsonFormat(hvoList1));
		 model.addAttribute("top10",hvoListTop10);
		 
		
		//政策法规10
		 Page<HealthEduArticleVo> page2=new Page<HealthEduArticleVo>(1,10);
		 vo.setPage(page2);
		 vo.setModuleId(1);
		 List<HealthEduArticleVo> hvoList5=	healthEduService.getArticleList(vo);
		 for (HealthEduArticleVo healthEduArticleVo : hvoList5) {
				String strimgs= healthEduArticleVo.getContent();
				
			    String imgSrc=this.getImgSrc(strimgs).get(0);
				 healthEduArticleVo.setImgSrc(imgSrc);
			 }
		 model.addAttribute("mod5",hvoList5);
		 model.addAttribute("mod5Json",JsonUtils.getJsonFormat(hvoList5));
		
		 return "/health/healthEdu";
	}
    
   //查询某个模块下的文章 每个模块下只返回5条数据 
	@ResponseBody
	@RequestMapping(value = "/byMod", method = RequestMethod.GET)
	public String byMod(HttpServletRequest request, Model model, HealthEduArticleVo vo,Integer pageNo,Integer pageSize){
		 SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
		 Page<HealthEduArticleVo> page=new Page<HealthEduArticleVo>(1,5);
		 vo.setPage(page);
		 List<HealthEduArticleVo> hvoList=	healthEduService.getArticleList(vo);
		//设置图片地址
		 for (HealthEduArticleVo healthEduArticleVo : hvoList) {
			String strimgs= healthEduArticleVo.getContent();
			
		    String imgSrc=this.getImgSrc(strimgs).get(0);
			 healthEduArticleVo.setImgSrc(imgSrc);
		 }
		 
		 return JsonUtils.getJsonFormat(hvoList);
	}
   //点击加载更多 ,查询下一页的数据返回
	@ResponseBody
	@RequestMapping(value = "/byModMore", method = RequestMethod.GET)
	public String byModMore(HttpServletRequest request, Model model, HealthEduArticleVo vo,Integer pageNo,Integer pageSize){
		
		 Page<HealthEduArticleVo> page=new Page<HealthEduArticleVo>(pageNo,pageSize);
		 vo.setPage(page);
		 List<HealthEduArticleVo> hvoList=	healthEduService.getArticleList(vo);
		 for (HealthEduArticleVo healthEduArticleVo : hvoList) {
				String strimgs= healthEduArticleVo.getContent();
			    String imgSrc=this.getImgSrc(strimgs).get(0);
				 healthEduArticleVo.setImgSrc(imgSrc);
			 }
		
		 return  JsonUtils.getJsonFormat(hvoList);
	}
	
	/**详情页面*/
	@RequestMapping(value = "/detail", method = RequestMethod.GET)
	public String detail(HttpServletRequest request, Model model, HealthEduArticleVo vo){
		 HealthEduArticleVo hvo=healthEduService.getArticle(vo.getId());
		 model.addAttribute("hvo", hvo);
		//TOP10,
		 HealthEduArticleVo HealthEduArticleVo=new HealthEduArticleVo();
		 List<HealthEduArticleVo> hvoListTop10=	healthEduService.getArticleList(HealthEduArticleVo);
		 System.out.println(JsonUtils.getJsonFormat(hvoListTop10));
		 model.addAttribute("hvoListTop10",hvoListTop10);
		 
		
		//政策法规10
		 Page<HealthEduArticleVo> page2=new Page<HealthEduArticleVo>(1,10);
		 HealthEduArticleVo.setPage(page2);
		 HealthEduArticleVo.setModuleId(1);
		 List<HealthEduArticleVo> hvoList5=	healthEduService.getArticleList(HealthEduArticleVo);
		 for (HealthEduArticleVo healthEduArticleVo : hvoList5) {
				String strimgs= healthEduArticleVo.getContent();
			    String imgSrc=this.getImgSrc(strimgs).get(0);
				 healthEduArticleVo.setImgSrc(imgSrc);
			 }
		 model.addAttribute("mod5",hvoList5);
		 System.out.println(hvoList5.size()+"ssDadDjjjjjjjjjjjjjjjjjjjjjjjjjJ");
		 System.out.println(JsonUtils.getJsonFormat(hvoList5));
		 model.addAttribute("mod5Json",JsonUtils.getJsonFormat(hvoList5));
		 return  "/health/healthTeachDetail";
	}
   //文章TOP 按点击排序查询10条数据
    //政策法规下10条数据
	/**获取图片地址*/
	public static List<String> getImgSrc(String htmlStr) {  
		
        String img = "";  
        Pattern p_image;  
        Matcher m_image;  
        List<String> pics = new ArrayList<String>();  
        // String regEx_img = "<img.*src=(.*?)[^>]*?>"; //图片链接地址  
        String regEx_img = "<img.*src\\s*=\\s*(.*?)[^>]*?>";  
        p_image = Pattern.compile(regEx_img, Pattern.CASE_INSENSITIVE);  
        m_image = p_image.matcher(htmlStr);  
        while (m_image.find()) {  
            img = img + "," + m_image.group();  
            // Matcher m =  
            // Pattern.compile("src=\"?(.*?)(\"|>|\\s+)").matcher(img); //匹配src  
            Matcher m = Pattern.compile("src\\s*=\\s*\"?(.*?)(\"|>|\\s+)").matcher(img);  
            while (m.find()) {  
                pics.add(m.group(1));  
            }  
        }  
        if(pics==null){
         //读取模板的IMG的地址
        	String str="http://182.151.199.4:8115/upload/article/5e1dded1.jpg";
        	pics.add(str);
        }
        
        return pics;  
    }  
}
