﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

using P0307_Command.Sample;

namespace P0307_Command.SampleCancelAble
{


    /// <summary>
    /// 具体命令（ConcreteCommand）角色：
    ///   定义一个接受者和行为之间的弱耦合；实现Execute()方法，负责调用接收考的相应操作。
    ///   
    /// 开发项目命令
    /// </summary>
    public class CodingCommandCancelAble : ICommandCancelAble
    {

        /// <summary>
        /// Command 接受者 : 开发人员.
        /// </summary>
        public DeveloperCancelAble dp { get; set; }

        /// <summary>
        /// 所对应的项目
        /// </summary>
        public WebProject project { get; set; }


        public void Excute()
        {
            dp.Coding(project);
        }


        /// <summary>
        /// 撤销操作
        /// </summary>
        public void Cancel()
        {
            dp.StopCoding(project);
        }
    }

    /// <summary>
    /// 具体命令（ConcreteCommand）角色：
    ///   定义一个接受者和行为之间的弱耦合；实现Execute()方法，负责调用接收考的相应操作。
    ///   
    /// 维护项目命令
    /// </summary>
    public class UpdateRoutineCommandCancelAble : ICommandCancelAble
    {
        /// <summary>
        /// Command 接受者 : 开发人员.
        /// </summary>
        public DeveloperCancelAble dp { get; set; }

        /// <summary>
        /// 所对应的项目
        /// </summary>
        public WebProject project { get; set; }


        public void Excute()
        {
            dp.UpdateRoutine(project);
        }


        /// <summary>
        /// 撤销操作
        /// </summary>
        public void Cancel()
        {
            dp.StopCoding(project);
        }
    }


}
