﻿//------------------------------------------------------------------------------
// <auto-generated>
//    此代码是根据模板生成的。
//
//    手动更改此文件可能会导致应用程序中发生异常行为。
//    如果重新生成代码，则将覆盖对此文件的手动更改。
// </auto-generated>
//------------------------------------------------------------------------------

using System;
using System.Data.Objects;
using System.Data.Objects.DataClasses;
using System.Data.EntityClient;
using System.ComponentModel;
using System.Xml.Serialization;
using System.Runtime.Serialization;

[assembly: EdmSchemaAttribute()]
#region EDM 关系源元数据

[assembly: EdmRelationshipAttribute("TestModel", "main_id_cons", "test_main", System.Data.Metadata.Edm.RelationshipMultiplicity.ZeroOrOne, typeof(MyWcfServiceLibrary.test_main), "test_sub", System.Data.Metadata.Edm.RelationshipMultiplicity.Many, typeof(MyWcfServiceLibrary.test_sub), true)]

#endregion

namespace MyWcfServiceLibrary
{
    #region 上下文
    
    /// <summary>
    /// 没有元数据文档可用。
    /// </summary>
    public partial class TestEntities : ObjectContext
    {
        #region 构造函数
    
        /// <summary>
        /// 请使用应用程序配置文件的“TestEntities”部分中的连接字符串初始化新 TestEntities 对象。
        /// </summary>
        public TestEntities() : base("name=TestEntities", "TestEntities")
        {
            this.ContextOptions.LazyLoadingEnabled = true;
            OnContextCreated();
        }
    
        /// <summary>
        /// 初始化新的 TestEntities 对象。
        /// </summary>
        public TestEntities(string connectionString) : base(connectionString, "TestEntities")
        {
            this.ContextOptions.LazyLoadingEnabled = true;
            OnContextCreated();
        }
    
        /// <summary>
        /// 初始化新的 TestEntities 对象。
        /// </summary>
        public TestEntities(EntityConnection connection) : base(connection, "TestEntities")
        {
            this.ContextOptions.LazyLoadingEnabled = true;
            OnContextCreated();
        }
    
        #endregion
    
        #region 分部方法
    
        partial void OnContextCreated();
    
        #endregion
    
        #region ObjectSet 属性
    
        /// <summary>
        /// 没有元数据文档可用。
        /// </summary>
        public ObjectSet<test_main> test_main
        {
            get
            {
                if ((_test_main == null))
                {
                    _test_main = base.CreateObjectSet<test_main>("test_main");
                }
                return _test_main;
            }
        }
        private ObjectSet<test_main> _test_main;
    
        /// <summary>
        /// 没有元数据文档可用。
        /// </summary>
        public ObjectSet<test_sub> test_sub
        {
            get
            {
                if ((_test_sub == null))
                {
                    _test_sub = base.CreateObjectSet<test_sub>("test_sub");
                }
                return _test_sub;
            }
        }
        private ObjectSet<test_sub> _test_sub;

        #endregion
        #region AddTo 方法
    
        /// <summary>
        /// 用于向 test_main EntitySet 添加新对象的方法，已弃用。请考虑改用关联的 ObjectSet&lt;T&gt; 属性的 .Add 方法。
        /// </summary>
        public void AddTotest_main(test_main test_main)
        {
            base.AddObject("test_main", test_main);
        }
    
        /// <summary>
        /// 用于向 test_sub EntitySet 添加新对象的方法，已弃用。请考虑改用关联的 ObjectSet&lt;T&gt; 属性的 .Add 方法。
        /// </summary>
        public void AddTotest_sub(test_sub test_sub)
        {
            base.AddObject("test_sub", test_sub);
        }

        #endregion
    }
    

    #endregion
    
    #region 实体
    
    /// <summary>
    /// 没有元数据文档可用。
    /// </summary>
    [EdmEntityTypeAttribute(NamespaceName="TestModel", Name="test_main")]
    [Serializable()]
    [DataContractAttribute(IsReference=true)]
    public partial class test_main : EntityObject
    {
        #region 工厂方法
    
        /// <summary>
        /// 创建新的 test_main 对象。
        /// </summary>
        /// <param name="id">id 属性的初始值。</param>
        public static test_main Createtest_main(global::System.Int32 id)
        {
            test_main test_main = new test_main();
            test_main.id = id;
            return test_main;
        }

        #endregion
        #region 基元属性
    
        /// <summary>
        /// 没有元数据文档可用。
        /// </summary>
        [EdmScalarPropertyAttribute(EntityKeyProperty=true, IsNullable=false)]
        [DataMemberAttribute()]
        public global::System.Int32 id
        {
            get
            {
                return _id;
            }
            set
            {
                if (_id != value)
                {
                    OnidChanging(value);
                    ReportPropertyChanging("id");
                    _id = StructuralObject.SetValidValue(value);
                    ReportPropertyChanged("id");
                    OnidChanged();
                }
            }
        }
        private global::System.Int32 _id;
        partial void OnidChanging(global::System.Int32 value);
        partial void OnidChanged();
    
        /// <summary>
        /// 没有元数据文档可用。
        /// </summary>
        [EdmScalarPropertyAttribute(EntityKeyProperty=false, IsNullable=true)]
        [DataMemberAttribute()]
        public global::System.String value
        {
            get
            {
                return _value;
            }
            set
            {
                OnvalueChanging(value);
                ReportPropertyChanging("value");
                _value = StructuralObject.SetValidValue(value, true);
                ReportPropertyChanged("value");
                OnvalueChanged();
            }
        }
        private global::System.String _value;
        partial void OnvalueChanging(global::System.String value);
        partial void OnvalueChanged();

        #endregion
    
        #region 导航属性
    
        /// <summary>
        /// 没有元数据文档可用。
        /// </summary>
        [XmlIgnoreAttribute()]
        [SoapIgnoreAttribute()]
        [DataMemberAttribute()]
        [EdmRelationshipNavigationPropertyAttribute("TestModel", "main_id_cons", "test_sub")]
        public EntityCollection<test_sub> test_sub
        {
            get
            {
                return ((IEntityWithRelationships)this).RelationshipManager.GetRelatedCollection<test_sub>("TestModel.main_id_cons", "test_sub");
            }
            set
            {
                if ((value != null))
                {
                    ((IEntityWithRelationships)this).RelationshipManager.InitializeRelatedCollection<test_sub>("TestModel.main_id_cons", "test_sub", value);
                }
            }
        }

        #endregion
    }
    
    /// <summary>
    /// 没有元数据文档可用。
    /// </summary>
    [EdmEntityTypeAttribute(NamespaceName="TestModel", Name="test_sub")]
    [Serializable()]
    [DataContractAttribute(IsReference=true)]
    public partial class test_sub : EntityObject
    {
        #region 工厂方法
    
        /// <summary>
        /// 创建新的 test_sub 对象。
        /// </summary>
        /// <param name="id">id 属性的初始值。</param>
        public static test_sub Createtest_sub(global::System.Int32 id)
        {
            test_sub test_sub = new test_sub();
            test_sub.id = id;
            return test_sub;
        }

        #endregion
        #region 基元属性
    
        /// <summary>
        /// 没有元数据文档可用。
        /// </summary>
        [EdmScalarPropertyAttribute(EntityKeyProperty=true, IsNullable=false)]
        [DataMemberAttribute()]
        public global::System.Int32 id
        {
            get
            {
                return _id;
            }
            set
            {
                if (_id != value)
                {
                    OnidChanging(value);
                    ReportPropertyChanging("id");
                    _id = StructuralObject.SetValidValue(value);
                    ReportPropertyChanged("id");
                    OnidChanged();
                }
            }
        }
        private global::System.Int32 _id;
        partial void OnidChanging(global::System.Int32 value);
        partial void OnidChanged();
    
        /// <summary>
        /// 没有元数据文档可用。
        /// </summary>
        [EdmScalarPropertyAttribute(EntityKeyProperty=false, IsNullable=true)]
        [DataMemberAttribute()]
        public Nullable<global::System.Int32> main_id
        {
            get
            {
                return _main_id;
            }
            set
            {
                Onmain_idChanging(value);
                ReportPropertyChanging("main_id");
                _main_id = StructuralObject.SetValidValue(value);
                ReportPropertyChanged("main_id");
                Onmain_idChanged();
            }
        }
        private Nullable<global::System.Int32> _main_id;
        partial void Onmain_idChanging(Nullable<global::System.Int32> value);
        partial void Onmain_idChanged();
    
        /// <summary>
        /// 没有元数据文档可用。
        /// </summary>
        [EdmScalarPropertyAttribute(EntityKeyProperty=false, IsNullable=true)]
        [DataMemberAttribute()]
        public global::System.String value
        {
            get
            {
                return _value;
            }
            set
            {
                OnvalueChanging(value);
                ReportPropertyChanging("value");
                _value = StructuralObject.SetValidValue(value, true);
                ReportPropertyChanged("value");
                OnvalueChanged();
            }
        }
        private global::System.String _value;
        partial void OnvalueChanging(global::System.String value);
        partial void OnvalueChanged();

        #endregion
    
        #region 导航属性
    
        /// <summary>
        /// 没有元数据文档可用。
        /// </summary>
        [XmlIgnoreAttribute()]
        [SoapIgnoreAttribute()]
        [DataMemberAttribute()]
        [EdmRelationshipNavigationPropertyAttribute("TestModel", "main_id_cons", "test_main")]
        public test_main test_main
        {
            get
            {
                return ((IEntityWithRelationships)this).RelationshipManager.GetRelatedReference<test_main>("TestModel.main_id_cons", "test_main").Value;
            }
            set
            {
                ((IEntityWithRelationships)this).RelationshipManager.GetRelatedReference<test_main>("TestModel.main_id_cons", "test_main").Value = value;
            }
        }
        /// <summary>
        /// 没有元数据文档可用。
        /// </summary>
        [BrowsableAttribute(false)]
        [DataMemberAttribute()]
        public EntityReference<test_main> test_mainReference
        {
            get
            {
                return ((IEntityWithRelationships)this).RelationshipManager.GetRelatedReference<test_main>("TestModel.main_id_cons", "test_main");
            }
            set
            {
                if ((value != null))
                {
                    ((IEntityWithRelationships)this).RelationshipManager.InitializeRelatedReference<test_main>("TestModel.main_id_cons", "test_main", value);
                }
            }
        }

        #endregion
    }

    #endregion
    
}