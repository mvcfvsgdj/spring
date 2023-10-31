package com.sh.product;

import static org.springframework.test.web.servlet.result.MockMvcResultMatchers.request;

import java.io.File;
import java.io.IOException;
import java.net.MalformedURLException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.core.io.Resource;
import org.springframework.core.io.UrlResource;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.google.gson.Gson;
import com.google.gson.GsonBuilder;
import com.sh.login.LoginDTO;

@Controller
public class ProductController {
	
	
	String fileDir = "c:\\test\\upload\\";// 물리적 폴더 만들어야함 c드라이브 안에 test폴더 생성후 test폴더안에 upload폴더 생성

	
	
	
	@Autowired
	private ProductService productservice;

	@GetMapping("/products")
	public String getProductList(Model model) {
		// ProductService를 통해 상품 목록을 가져와서 모델에 추가
		List<ProductDTO> products = productservice.getProductList();

		// System.out.println("dfdfd=" + products);

		model.addAttribute("products", products);
		return "productList";
	}

	///////////////////////////// 상품 상세정보 /////////////////////////////////////////////////////////////////////

	@GetMapping("/products/detail")
	public String showProductDetail(@RequestParam String boardId, Model model) {
		// ProductService를 통해 상품 및 이미지 정보 가져오기
		ProductDTO product = productservice.getProductById(boardId);

		productservice.increaseClick(boardId);
		// 모델에 상품 정보 추가
		model.addAttribute("product", product);

		return "productDetail";
	}

	///////////////////////////// 상품등록 /////////////////////////////////////////////////////////////////////

	@GetMapping("/products/add")
	public String showAddProductForm(Model model) {
		String categoriesJson = productservice.getAllCategoriesJson();
		
		
		// System.out.println(json2);
		model.addAttribute("item", categoriesJson);
	

		return "addProductForm";
	}

	@PostMapping("/products/add")
	public String addProduct(ProductDTO product, Model model, HttpServletRequest request, MultipartFile file)
			throws IllegalStateException, IOException {
		// ProductService를 통해 상품 추가
		// MultipartFile file 부분은 파일 업로드시 사용
		
		System.out.println(product);
		System.out.println(file);

		//파일 업로드 부분
		String fileRealName = "";
		if (!file.isEmpty()) {
			fileRealName = file.getOriginalFilename();
			System.out.println(fileRealName);
			String fullPath = fileDir + fileRealName; // "C:\\test\\upload\\test.jpg"
			file.transferTo(new File(fullPath));
			model.addAttribute("fileName", fileRealName);
		}

		product.setBoard_Img(fileRealName);
		productservice.insertProductData(product);

//	        System.out.println("Title: " + product.getBoard_Title());
//	        System.out.println("Price: " + product.getBoard_Price());
//	        System.out.println("Description: " + product.getBoard_Text());
//	        System.out.println("Image URL: " + product.getBoard_Img());

		return "redirect:/products";
	}

	///////////////////////////// 상품 업데이트 /////////////////////////////////////////////////////////////////////

	@GetMapping("/products/update")
	public String updateProductForm(ProductDTO product, @RequestParam String boardId, Model model) {
		product = productservice.getProductById(boardId);
		String categoriesJson = productservice.getAllCategoriesJson();
		
	
		// System.out.println(json2);
		model.addAttribute("item", categoriesJson);
		model.addAttribute("product", product);
		return "updateProductForm";
	}

	@PostMapping("/products/update")
	public String updateProduct(ProductDTO product, Model model, MultipartFile file, @RequestParam String boardId,
			HttpServletRequest request) throws IllegalStateException, IOException {
		// ProductService를 통해 상품 수정

		String fileRealName = null;

		if (file != null && !file.isEmpty()) {
			fileRealName = file.getOriginalFilename();
			// System.out.println(fileRealName);

			String fullPath = fileDir + fileRealName; // "C:\\test\\upload\\test.jpg"
			file.transferTo(new File(fullPath));
			model.addAttribute("fileName", fileRealName);

			// 이미지 파일이 업데이트되면 데이터베이스에 반영
			product.setBoard_Img(fileRealName);
		}

		// 상품의 boardId 설정
		product.setBoard_Id(boardId);

		// 상품 수정이 성공하면 목록 페이지로 리다이렉션
		int updateResult = productservice.updateProduct(product);
		if (updateResult > 0) {
			System.out.println("상품 수정 성공!");
			return "redirect:/products";
		} else {
			System.out.println("상품 수정 실패!");

			return "redirect:/products";
		}
	}

	///////////////////////////// 상품삭제 /////////////////////////////////////////////////////////////////////
	@PostMapping("/products/delete")
	public String productDelete(@RequestParam String boardId, Model model) {
		ProductDTO product = productservice.getProductById(boardId);
		productservice.deleteProduct(boardId);
		model.addAttribute("product", product);
		return "redirect:/products";
	}
	
	@PostMapping("/products/like")
	@ResponseBody
	public Map<String, Object> likeRequest(@RequestParam String boardId, HttpSession session) {
	    Map<String, Object> response = new HashMap<>();

	    try {
	        // 세션에서 사용자 코드 가져오기 (세션에서 사용자 정보를 어떻게 저장하고 있는지에 따라 코드가 달라질 수 있습니다)
	        String userCode = (String) session.getAttribute("user_Code");

	        // 좋아요 추가 또는 제거
	        productService.toggleLike(boardId, userCode);

	        // 좋아요 개수 조회
	        int likeCount = productService.getLikeCount(boardId);

	        response.put("success", true);
	        response.put("likeCount", likeCount);
	    } catch (Exception e) {
	        response.put("success", false);
	        response.put("error", "Failed to process like request.");
	    }

	    return response;
	}
	

	///////////////////// 이미지 저장경로,저장하는 코드 //////////////////////////////////////////////////////////////
	@ResponseBody
	@RequestMapping(value = "/images/{fileName:.*}", method = RequestMethod.GET)
	public Resource imageView(@PathVariable String fileName) throws MalformedURLException {
		return new UrlResource("file:c:\\test\\upload\\" + fileName);
	}
}






