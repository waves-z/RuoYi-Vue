package com.ruoyi.web.controller.bbs;

import java.util.List;
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
import com.ruoyi.bbs.domain.BbsComment;
import com.ruoyi.bbs.service.IBbsCommentService;
import com.ruoyi.common.utils.poi.ExcelUtil;
import com.ruoyi.common.core.page.TableDataInfo;
import com.ruoyi.common.utils.DateUtils;
import com.ruoyi.common.utils.SecurityUtils;

/**
 * 帖子评论Controller
 */
@RestController
@RequestMapping("/bbs/comment")
public class BbsCommentController extends BaseController {
    @Autowired
    private IBbsCommentService bbsCommentService;

    /**
     * 查询帖子评论列表
     */
    @GetMapping("/list/{postId}")
    public AjaxResult list(@PathVariable("postId") Long postId) {
        BbsComment bbsComment = new BbsComment();
        bbsComment.setPostId(postId);
        List<BbsComment> list = bbsCommentService.selectBbsCommentList(bbsComment);
        return success(list);
    }

    /**
     * 获取帖子评论详细信息
     */
    @GetMapping(value = "/{commentId}")
    public AjaxResult getInfo(@PathVariable("commentId") Long commentId) {
        return success(bbsCommentService.selectBbsCommentById(commentId));
    }

    /**
     * 新增帖子评论
     */
    @PostMapping
    public AjaxResult add(@RequestBody BbsComment bbsComment) {
        bbsComment.setUserId(SecurityUtils.getUserId());
        bbsComment.setCreateBy(SecurityUtils.getUsername());
        bbsComment.setCreateTime(DateUtils.getNowDate());
        return toAjax(bbsCommentService.insertBbsComment(bbsComment));
    }

    /**
     * 修改帖子评论
     */
    @PutMapping
    public AjaxResult edit(@RequestBody BbsComment bbsComment) {
        return toAjax(bbsCommentService.updateBbsComment(bbsComment));
    }

    /**
     * 删除帖子评论
     */
    @DeleteMapping("/{commentId}")
    public AjaxResult remove(@PathVariable Long commentId) {
        // 验证是否是评论作者或管理员
        BbsComment comment = bbsCommentService.selectBbsCommentById(commentId);
        if (comment != null) {
            if (comment.getUserId().equals(SecurityUtils.getUserId()) || SecurityUtils.isAdmin(SecurityUtils.getUserId())) {
                return toAjax(bbsCommentService.deleteBbsCommentById(commentId));
            }
            return error("无权删除他人评论");
        }
        return error("评论不存在");
    }

    /**
     * 审批通过评论
     */
    @PreAuthorize("@ss.hasRole('admin')")
    @PutMapping("/{commentId}/approve")
    public AjaxResult approve(@PathVariable("commentId") Long commentId) {
        return toAjax(bbsCommentService.updateCommentStatus(commentId, "0"));
    }

    /**
     * 审批不通过评论
     */
    @PreAuthorize("@ss.hasRole('admin')")
    @PutMapping("/{commentId}/reject")
    public AjaxResult reject(@PathVariable("commentId") Long commentId) {
        return toAjax(bbsCommentService.updateCommentStatus(commentId, "2"));
    }
} 