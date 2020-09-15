package com.oracle.entity;

import java.util.List;

public class PageBean<T> {
    private int page,rowcount,pagesize;
    private List<T> list;
    private int pages;

    public void setPage(int page) {
        this.page = page;
    }

    public void setRowcount(int rowcount) {
        this.rowcount = rowcount;
    }

    public void setPagesize(int pagesize) {
        this.pagesize = pagesize;
    }

    public void setList(List<T> list) {
        this.list = list;
    }

    public void setPages(int pages) {
        this.pages = pages;
    }

    public int getPage() {
        return page;
    }

    public int getRowcount() {
        return rowcount;
    }

    public int getPagesize() {
        return pagesize;
    }

    public List<T> getList() {
        return list;
    }

    public int getPages() {
        return pages;
    }
}
