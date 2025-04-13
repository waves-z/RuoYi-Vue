package com.ruoyi.bbs.mapper;

import java.util.List;
import com.ruoyi.bbs.domain.BbsLike;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

/**
 * 帖子点赞Mapper接口
 */
@Mapper
public interface BbsLikeMapper {
    /**
     * 查询帖子点赞
     */
    public BbsLike selectBbsLikeById(Long id);

    /**
     * 查询帖子点赞列表
     */
    public List<BbsLike> selectBbsLikeList(BbsLike bbsLike);

    /**
     * 新增帖子点赞
     */
    public int insertBbsLike(BbsLike bbsLike);

    /**
     * 修改帖子点赞
     */
    public int updateBbsLike(BbsLike bbsLike);

    /**
     * 删除帖子点赞
     */
    public int deleteBbsLikeById(Long id);

    /**
     * 批量删除帖子点赞
     */
    public int deleteBbsLikeByIds(Long[] ids);

    /**
     * 检查用户是否已点赞帖子
     */
    public int checkLike(@Param("postId") Long postId, @Param("userId") Long userId);

    /**
     * 删除用户对帖子的点赞
     */
    public int deleteLike(@Param("postId") Long postId, @Param("userId") Long userId);
} 