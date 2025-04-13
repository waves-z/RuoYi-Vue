package com.ruoyi.web.controller.bbs;

import java.util.List;
import javax.servlet.http.HttpServletResponse;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;
import com.ruoyi.common.annotation.Log;
import com.ruoyi.common.core.controller.BaseController;
import com.ruoyi.common.core.domain.AjaxResult;
import com.ruoyi.common.enums.BusinessType;
import com.ruoyi.system.domain.BbsPost;
import com.ruoyi.system.service.IBbsPostService;
import com.ruoyi.common.utils.poi.ExcelUtil;
import com.ruoyi.common.core.page.TableDataInfo;
import com.ruoyi.common.utils.SecurityUtils;
import com.ruoyi.common.utils.DateUtils;

/**
 * 帖子Controller
 */
@RestController
@RequestMapping("/bbs/post")
public class BbsPostController extends BaseController {
    @Autowired
    private IBbsPostService bbsPostService;

    /**
     * 判断当前用户是否为管理员
     */
    private boolean isAdmin() {
        return getLoginUser().getUser().isAdmin();
    }

    /**
     * 查询帖子列表
     */
    @GetMapping("/list")
    public TableDataInfo list(BbsPost bbsPost) {
        startPage();
        // 设置是否为管理员的标志
        bbsPost.setIsAdmin(SecurityUtils.hasRole("admin"));
        // 设置当前用户ID，用于查询权限控制
        bbsPost.setUserId(SecurityUtils.getUserId());
        List<BbsPost> list = bbsPostService.selectBbsPostList(bbsPost);
        return getDataTable(list);
    }

    /**
     * 获取帖子详细信息
     */
    @GetMapping(value = "/{postId}")
    public AjaxResult getInfo(@PathVariable("postId") Long postId) {
        return AjaxResult.success(bbsPostService.selectBbsPostByPostId(postId));
    }

    /**
     * 新增帖子
     */
    @Log(title = "帖子", businessType = BusinessType.INSERT)
    @PostMapping
    public AjaxResult add(@RequestBody BbsPost bbsPost) {
        // 设置作者为当前用户
        bbsPost.setAuthorId(SecurityUtils.getUserId());
        bbsPost.setAuthorName(SecurityUtils.getUsername());
        // 设置创建时间和更新时间
        bbsPost.setCreateTime(DateUtils.getNowDate());
        bbsPost.setUpdateTime(DateUtils.getNowDate());
        // 设置默认状态为待审核
        bbsPost.setStatus("1");
        return toAjax(bbsPostService.insertBbsPost(bbsPost));
    }

    /**
     * 修改帖子
     */
    @Log(title = "帖子", businessType = BusinessType.UPDATE)
    @PutMapping
    public AjaxResult edit(@RequestBody BbsPost bbsPost) {
        // 检查权限：用户只能修改自己的帖子，管理员可以修改所有
        BbsPost existingPost = bbsPostService.selectBbsPostByPostId(bbsPost.getPostId());
        if (existingPost == null) {
            return error("帖子不存在");
        }
        if (!getUserId().equals(existingPost.getAuthorId()) && !isAdmin()) {
            return error("没有权限修改此帖子");
        }

        // 保持原有的不变字段
        bbsPost.setAuthorId(existingPost.getAuthorId());
        bbsPost.setAuthorName(existingPost.getAuthorName());
        bbsPost.setCreateTime(existingPost.getCreateTime());
        bbsPost.setCreateBy(existingPost.getCreateBy());
        bbsPost.setViewCount(existingPost.getViewCount());
        bbsPost.setLikeCount(existingPost.getLikeCount());
        bbsPost.setCommentCount(existingPost.getCommentCount());

        // 设置更新相关字段
        bbsPost.setUpdateTime(DateUtils.getNowDate());
        bbsPost.setUpdateBy(getUsername());

        return toAjax(bbsPostService.updateBbsPost(bbsPost));
    }

    /**
     * 删除帖子
     */
    @Log(title = "帖子", businessType = BusinessType.DELETE)
    @DeleteMapping("/{postIds}")
    public AjaxResult remove(@PathVariable Long[] postIds) {
        // 检查权限：用户只能删除自己的帖子，管理员可以删除所有
        for (Long postId : postIds) {
            BbsPost existingPost = bbsPostService.selectBbsPostByPostId(postId);
            if (existingPost == null) {
                return error("帖子不存在");
            }
            if (!getUserId().equals(existingPost.getAuthorId()) && !isAdmin()) {
                return error("没有权限删除此帖子");
            }
        }
        return toAjax(bbsPostService.deleteBbsPostByPostIds(postIds));
    }

    /**
     * 修改帖子状态
     */
    @PreAuthorize("@ss.hasPermi('system:post:edit')")
    @Log(title = "帖子状态", businessType = BusinessType.UPDATE)
    @PutMapping("/{postId}/status")
    public AjaxResult updateStatus(@PathVariable Long postId, @RequestBody BbsPost bbsPost) {
        // 只有管理员可以修改帖子状态
        if (!isAdmin()) {
            return error("没有权限修改帖子状态");
        }
        // 检查帖子是否存在
        BbsPost existingPost = bbsPostService.selectBbsPostByPostId(postId);
        if (existingPost == null) {
            return error("帖子不存在");
        }
        // 检查状态是否合法
        if (!"0".equals(bbsPost.getStatus()) && !"1".equals(bbsPost.getStatus()) && !"2".equals(bbsPost.getStatus())) {
            return error("无效的状态值");
        }
        // 设置帖子ID和更新时间
        bbsPost.setPostId(postId);
        bbsPost.setUpdateTime(DateUtils.getNowDate());
        bbsPost.setUpdateBy(getUsername());
        return toAjax(bbsPostService.updatePostStatus(bbsPost));
    }

    /**
     * 获取热门帖子
     */
    @GetMapping("/hot")
    public AjaxResult getHotPosts() {
        return success(bbsPostService.selectHotPostList());
    }

    /**
     * 获取最新帖子
     */
    @GetMapping("/latest")
    public AjaxResult getLatestPosts() {
        BbsPost bbsPost = new BbsPost();
        return success(bbsPostService.selectLatestPostList(bbsPost));
    }

    /**
     * 增加帖子浏览量
     */
    @PostMapping("/{postId}/view")
    public AjaxResult incrementViewCount(@PathVariable Long postId) {
        return toAjax(bbsPostService.incrementViewCount(postId));
    }

    /**
     * 增加帖子点赞数
     */
    @PostMapping("/{postId}/like")
    public AjaxResult incrementLikeCount(@PathVariable Long postId) {
        return toAjax(bbsPostService.incrementLikeCount(postId));
    }

    /**
     * 增加帖子评论数
     */
    @PostMapping("/{postId}/comment")
    public AjaxResult incrementCommentCount(@PathVariable Long postId) {
        return toAjax(bbsPostService.incrementCommentCount(postId));
    }
} 