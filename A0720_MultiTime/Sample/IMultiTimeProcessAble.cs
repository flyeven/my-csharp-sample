using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace A0720_MultiTime.Sample
{

    /// <summary>
    ///  支持多次数据处理的类.
    /// </summary>
    public interface IMultiTimeProcessAble
    {

        // 用于判断数据唯一性的 ID.
        string GetID();


        // 用于判断是否多次的 关键字.
        string GetKeyWord();


    }



}
