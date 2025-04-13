package com.ruoyi.system.service.impl;

import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.ruoyi.system.mapper.BbsCategoryMapper;
import com.ruoyi.common.core.domain.entity.BbsCategory;
import com.ruoyi.system.service.IBbsCategoryService;

/**
 * 帖子分类Service业务层处理
 */
@Service
public class BbsCategoryServiceImpl implements IBbsCategoryService {
    @Autowired
    private BbsCategoryMapper bbsCategoryMapper;

    /**
     * 查询帖子分类
     * 
     * @param categoryId 帖子分类主键
     * @return 帖子分类
     */
    @Override
    public BbsCategory selectBbsCategoryByCategoryId(Long categoryId) {
        return bbsCategoryMapper.selectBbsCategoryByCategoryId(categoryId);
    }

    /**
     * 查询帖子分类列表
     * 
     * @param bbsCategory 帖子分类
     * @return 帖子分类
     */
    @Override
    public List<BbsCategory> selectBbsCategoryList(BbsCategory bbsCategory) {
        return bbsCategoryMapper.selectBbsCategoryList(bbsCategory);
    }

    /**
     * 新增帖子分类
     * 
     * @param bbsCategory 帖子分类
     * @return 结果
     */
    @Override
    public int insertBbsCategory(BbsCategory bbsCategory) {
        return bbsCategoryMapper.insertBbsCategory(bbsCategory);
    }

    /**
     * 修改帖子分类
     * 
     * @param bbsCategory 帖子分类
     * @return 结果
     */
    @Override
    public int updateBbsCategory(BbsCategory bbsCategory) {
        return bbsCategoryMapper.updateBbsCategory(bbsCategory);
    }

    /**
     * 批量删除帖子分类
     * 
     * @param categoryIds 需要删除的帖子分类主键
     * @return 结果
     */
    @Override
    public int deleteBbsCategoryByCategoryIds(Long[] categoryIds) {
        return bbsCategoryMapper.deleteBbsCategoryByCategoryIds(categoryIds);
    }

    /**
     * 删除帖子分类信息
     * 
     * @param categoryId 帖子分类主键
     * @return 结果
     */
    @Override
    public int deleteBbsCategoryByCategoryId(Long categoryId) {
        return bbsCategoryMapper.deleteBbsCategoryByCategoryId(categoryId);
    }
} 