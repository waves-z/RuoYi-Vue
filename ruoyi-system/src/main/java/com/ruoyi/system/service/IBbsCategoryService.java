package com.ruoyi.system.service;

import java.util.List;
import com.ruoyi.common.core.domain.entity.BbsCategory;

/**
 * 帖子分类Service接口
 */
public interface IBbsCategoryService {
    /**
     * 查询帖子分类
     * 
     * @param categoryId 帖子分类主键
     * @return 帖子分类
     */
    public BbsCategory selectBbsCategoryByCategoryId(Long categoryId);

    /**
     * 查询帖子分类列表
     * 
     * @param bbsCategory 帖子分类
     * @return 帖子分类集合
     */
    public List<BbsCategory> selectBbsCategoryList(BbsCategory bbsCategory);

    /**
     * 新增帖子分类
     * 
     * @param bbsCategory 帖子分类
     * @return 结果
     */
    public int insertBbsCategory(BbsCategory bbsCategory);

    /**
     * 修改帖子分类
     * 
     * @param bbsCategory 帖子分类
     * @return 结果
     */
    public int updateBbsCategory(BbsCategory bbsCategory);

    /**
     * 批量删除帖子分类
     * 
     * @param categoryIds 需要删除的帖子分类主键集合
     * @return 结果
     */
    public int deleteBbsCategoryByCategoryIds(Long[] categoryIds);

    /**
     * 删除帖子分类信息
     * 
     * @param categoryId 帖子分类主键
     * @return 结果
     */
    public int deleteBbsCategoryByCategoryId(Long categoryId);
} 