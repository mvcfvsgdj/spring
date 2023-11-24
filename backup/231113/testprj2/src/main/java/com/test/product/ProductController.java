package com.test.product;

import java.io.File;
import java.io.IOException;
import java.net.MalformedURLException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.json.JSONArray;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.core.io.Resource;
import org.springframework.core.io.UrlResource;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.google.gson.Gson;
import com.google.gson.GsonBuilder;

@Controller
public class ProductController {
	String fileDir = "c:\\test\\upload\\";//물리적 폴더 만들어야함
	
    @Autowired
    private ProductService productService;

    @GetMapping("/products")
    public String getProductList(Model model) {
    	// ProductService를 통해 상품 목록을 가져와서 모델에 추가
        List<Product> products = productService.getlist();
      
        
        System.out.println("dfdfd=" +products);
  
        model.addAttribute("products", products);
        return "productList";
    }

    @GetMapping("/products/add")
    public String showAddProductForm(Model model) {
    	List<cate> list1 =  productService.getAllCategories("서울시"); 		
		List<cate> list2 = productService.getAllCategories("제주도");	
		List<cate> list3 = productService.getAllCategories("경기도");	
		List<cate> list4 = productService.getAllCategories("충청도");	
		List<cate> list5 = productService.getAllCategories("경상도");	
		List<cate> list6 = productService.getAllCategories("전라도");	
		List<cate> list7 = productService.getAllCategories("강원도");	
		
		System.out.println( list1);
		
		
		Map<String, List<cate>>  map = new HashMap<>();
		map.put("서울시", list1);
		map.put("제주도", list2); 
		map.put("경기도", list3); 
		map.put("충청도", list4); 
		map.put("경상도", list5); 
		map.put("전라도", list6); 
		map.put("강원도", list7); 
	 
		
		Gson gson = new GsonBuilder().create();
		
		String json2 = gson.toJson(map);
		
		
		System.out.println(json2);
		model.addAttribute("item" , json2);
    	
		
        return "addProductForm";
    }

    @GetMapping("/products/detail")
    public String showProductDetail(@RequestParam String boardId, Model model) {
        // ProductService를 통해 상품 및 이미지 정보 가져오기
        Product product = productService.selectProImagesById(boardId);
        productService.increaseClick(boardId);
        // 모델에 상품 정보 추가
        model.addAttribute("product", product);

        return "productDetail";
    }

//상품등록 
    
 
    @PostMapping("/products/add")
    public String addProduct(Product product ,Model model , MultipartFile file) throws IllegalStateException, IOException {
        // ProductService를 통해 상품 추가
    
		
		
    	System.out.println(product);
    	System.out.println(file);
    	
    	
    
    	
    	String fileRealName ="";
		if(!file.isEmpty()) {
	    fileRealName =	file.getOriginalFilename();
		System.out.println(fileRealName);
		String fullPath = fileDir + fileRealName; // "C:\\test\\upload\\test.jpg"
		file.transferTo(new File(fullPath));
		model.addAttribute("fileName",fileRealName);
		}
		
		 
		
		product.setBoard_Id("test61");
		product.setBoard_Img(fileRealName);
        productService.insertProData(product);
        
        
        System.out.println("Title: " + product.getBoard_Title());
        System.out.println("Price: " + product.getBoard_Price());
        System.out.println("Description: " + product.getBoard_Text());
        System.out.println("Image URL: " + product.getBoard_Img());

        return "redirect:/products";
    }

    @ResponseBody
	@RequestMapping(value="/images/{fileName:.*}", method=RequestMethod.GET)
	public Resource  imageView(@PathVariable String fileName) throws MalformedURLException {		
		return new UrlResource("file:c:\\test\\upload\\"+ fileName);		
	}
}