package com.ruoyi.bbs.controller;

import com.ruoyi.bbs.domain.BbsLike;
import com.ruoyi.bbs.service.IBbsLikeService;
import com.ruoyi.common.core.domain.AjaxResult;
import com.ruoyi.common.utils.SecurityUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

@RestController
@RequestMapping("/bbs/like")
public class BbsLikeController {

    @Autowired
    private IBbsLikeService bbsLikeService;

    @GetMapping("/status")
    public AjaxResult getLikeStatus(@RequestParam Long postId, @RequestParam(required = false) Long userId) {
        if (userId == null) {
            userId = SecurityUtils.getUserId();
        }
        boolean isLiked = bbsLikeService.checkLikeStatus(userId, postId, null);
        return AjaxResult.success(isLiked);
    }

    @PostMapping("/toggle")
    public AjaxResult toggleLike(@RequestBody BbsLike like) {
        if (like.getUserId() == null) {
            like.setUserId(SecurityUtils.getUserId());
        }
        int result = bbsLikeService.toggleLike(like.getPostId(), like.getUserId());
        return AjaxResult.success(result);
    }
} 