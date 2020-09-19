// Copyright 2017 Vckai Author. All Rights Reserved.
//
// Licensed under the Apache License, Version 2.0 (the "License");
// you may not use this file except in compliance with the License.
// You may obtain a copy of the License at
//
//      http://www.apache.org/licenses/LICENSE-2.0
//
// Unless required by applicable law or agreed to in writing, software
// distributed under the License is distributed on an "AS IS" BASIS,
// WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
// See the License for the specific language governing permissions and
// limitations under the License.

package models

import (
	"fmt"
	"strings"
	"time"

	"github.com/astaxie/beego/orm"
)

// 小说分类
type Cate struct {
	Id        uint32 `orm:"auto;size(11)"`
	Name      string `orm:"size(100)"`
	IsMenu    uint8  `orm:"size(1);default(0)"`
	IsHome    uint8  `orm:"size(1);default(0)"`
	CreatedAt uint32 `orm:"size(11);default(0)"`
	UpdatedAt uint32 `orm:"size(11);default(0)"`
	DeletedAt uint32 `orm:"size(11);default(0)`
}

func NewCate() *Cate {
	return &Cate{}
}

// 初始化
// 注册模型
func init() {
	orm.RegisterModelWithPrefix(TABLE_PREFIX, new(Cate))
}

func (m *Cate) query() orm.QuerySeter {
	return orm.NewOrm().QueryTable(m)
}

// 添加
func (m *Cate) Insert() error {
	m.CreatedAt = uint32(time.Now().Unix())
	m.UpdatedAt = uint32(time.Now().Unix())
	if _, err := orm.NewOrm().Insert(m); err != nil {
		return err
	}
	return nil
}

// 读取
func (m *Cate) Read(fields ...string) error {
	if err := orm.NewOrm().Read(m, fields...); err != nil {
		return err
	}
	return nil
}

// 修改
func (m *Cate) Update(fields ...string) error {
	m.UpdatedAt = uint32(time.Now().Unix())
	if len(fields) > 0 {
		fields = append(fields, "updated_at")
	}
	if _, err := orm.NewOrm().Update(m, fields...); err != nil {
		return err
	}
	return nil
}

// 批量删除
func (m *Cate) DeleteBatch(ids []string) error {
	marks := make([]string, len(ids))
	for i := range marks {
		marks[i] = "?"
	}
	sqlStr := fmt.Sprintf("DELETE FROM %scate WHERE `id` IN(%s)", TABLE_PREFIX, strings.Join(marks, ", "))

	_, err := orm.NewOrm().Raw(sqlStr, ids).Exec()

	return err
}

// 删除
func (m *Cate) Delete(forceDelete ...bool) error {
	// 软删除
	if len(forceDelete) == 0 {
		m.DeletedAt = uint32(time.Now().Unix())
		return m.Update("deleted_at")
	}

	// 强制删除
	if _, err := orm.NewOrm().Delete(m); err != nil {
		return err
	}
	return nil
}

// 获取分类列表
func (m *Cate) GetAll() []*Cate {
	list := make([]*Cate, 0)
	m.query().Filter("deleted_at", 0).All(&list, "id", "name", "is_menu", "is_home", "created_at")

	return list
}

// 获取是否菜单
func (m Cate) IsMenuName() string {
	if m.IsMenu == 0 {
		return `<span class="layui-btn layui-btn-primary layui-btn-xs">否</span>`
	}

	return `<span class="layui-btn layui-btn-xs">是</span>`
}

// 获取是否首页显示
func (m Cate) IsHomeName() string {
	if m.IsHome == 0 {
		return `<span class="layui-btn layui-btn-primary layui-btn-xs">否</span>`
	}

	return `<span class="layui-btn layui-btn-xs">是</span>`
}
