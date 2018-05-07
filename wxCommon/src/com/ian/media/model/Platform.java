package com.ian.media.model;

public class Platform {
    private String id;

    private String platformuser;//创建人，

    private String platformtime;//创建时间

    private String platformstate;//状态

    private String platform;// 平台简介

    public String getId() {
        return id;
    }

    public void setId(String id) {
        this.id = id == null ? null : id.trim();
    }

    public String getPlatformuser() {
        return platformuser;
    }

    public void setPlatformuser(String platformuser) {
        this.platformuser = platformuser == null ? null : platformuser.trim();
    }

    public String getPlatformtime() {
        return platformtime;
    }

    public void setPlatformtime(String platformtime) {
        this.platformtime = platformtime == null ? null : platformtime.trim();
    }

    public String getPlatformstate() {
        return platformstate;
    }

    public void setPlatformstate(String platformstate) {
        this.platformstate = platformstate == null ? null : platformstate.trim();
    }

    public String getPlatform() {
        return platform;
    }

    public void setPlatform(String platform) {
        this.platform = platform == null ? null : platform.trim();
    }
}