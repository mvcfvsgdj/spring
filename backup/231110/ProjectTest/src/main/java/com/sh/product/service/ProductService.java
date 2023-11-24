package com.sh.product.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.google.gson.Gson;
import com.google.gson.GsonBuilder;
import com.sh.product.domain.ProductDTO;
import com.sh.product.domain.cateDTO;
import com.sh.product.repository.ProductRepository;

@Service
public class ProductService implements ProductServiceI {
	@Autowired
	private ProductRepository productRepository;

	@Override
	public List<ProductDTO> getProductList() {

		List<ProductDTO> result = productRepository.getlist();

		return result;
	}

	@Override
	public void increaseClick(String boardId) {
		productRepository.increaseClick(boardId);
	}

	@Override
	public void insertProductData(ProductDTO product) {
		productRepository.insertProData(product);
	}

	@Override
	public ProductDTO getProductById(String boardId) {
		return productRepository.selectProImagesById(boardId);
	}

	@Override
	public List<cateDTO> getCategory() {
		return productRepository.getCategory();
	}

	@Override
	public List<cateDTO> getAllCategories(String loc_code) {
		return productRepository.getAllCategories(loc_code);
	}

	@Override
	public void deleteProduct(String boardId) {
		productRepository.deleteProduct(boardId);
	}

	@Override
	public int updateProduct(ProductDTO product) {
		return productRepository.updateProduct(product);
	}

	@Override
	public void updateDate(String boardId) {
		productRepository.updateDate(boardId);
	}

	/*
	 * public Map<String, List<cateDTO>> getAllCategoriesMap() { return
	 * productRepository.getAllCategoriesMap(); }
	 */

	@Override
	public String getAllCategoriesJson() {

		Map<String, List<cateDTO>> map = new HashMap<>();
		map.put("서울시", productRepository.getAllCategories("서울시"));
		map.put("제주도", productRepository.getAllCategories("제주도"));
		map.put("경기도", productRepository.getAllCategories("경기도"));
		map.put("충청도", productRepository.getAllCategories("충청도"));
		map.put("경상도", productRepository.getAllCategories("경상도"));
		map.put("전라도", productRepository.getAllCategories("전라도"));
		map.put("강원도", productRepository.getAllCategories("강원도"));

		Gson gson = new GsonBuilder().create();
		String jsonResult = gson.toJson(map);
		return jsonResult;
	}

	@Override
	public void toggleLike(String boardId, String userCode) {
		Map<String, String> likeInfo = new HashMap<>();
		likeInfo.put("boardId", boardId);
		likeInfo.put("userCode", userCode);

		int likeCount = productRepository.getLikeCount(boardId);

		if (likeCount > 0) {
			// 이미 좋아요를 누른 상태이면 좋아요 취소

			productRepository.removeLike(likeInfo);
		} else {
			// 좋아요를 누르지 않은 상태이면 좋아요 추가
			productRepository.addLike(likeInfo);
		}
	}

	// 좋아요 개수 조회

	@Override
	public int getLikeCount(String board_Id) {
		return productRepository.getLikeCount(board_Id);
	}

	////////////////////////////////////

	@Override
	public void insertLike(ProductDTO product) {
		productRepository.insertLike(product);
	}

}