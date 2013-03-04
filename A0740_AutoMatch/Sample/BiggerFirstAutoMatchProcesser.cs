using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace A0740_AutoMatch.Sample
{


    /// <summary>
    /// 自动匹配处理.
    /// 
    /// 
    /// 当某个时间点上， 需要完整 “帐户清零” 的处理时。
    /// 系统需要自动按照  帐户的剩余点数， 做自动匹配的消耗处理。
    /// 
    /// 例如：
    /// 当前系统， 有下列 可兑换礼品：
    /// 
    /// 名称        消耗点数.
    /// 礼品A       300
    /// 礼品B       400
    /// 礼品C       500
    /// 
    /// 
    /// 本类使用 大数字优先的算法， 优先消耗掉大的点数。
    /// 
    /// 
    /// 帐户剩余点数    消耗方式       剩余
    /// 1500            3个C           0
    /// 1400            2个C 1个B      0
    /// 1300            2个C 1个A      0
    /// 1200            2个C           200
    /// 1100            2个C           100
    /// 1000            2个C           0
    /// 900             1个C 1个B      0
    /// 800             1个C 1个A      0
    /// 700             1个C           200
    /// 600             1个C           100
    /// 500             1个C           0
    /// 400             1个B           0
    /// 300             1个A           0
    /// 200             -              200
    /// 100             -              100
    /// </summary>
    public class BiggerFirstAutoMatchProcesser : IAutoMatchProcesser
    {

        /// <summary>
        /// 可消耗的商品列表
        /// </summary>
        public List<IAutoMatchAble> BaseDataList
        {
            get;
            set;
        }



        /// <summary>
        /// 处理完毕后， 节余点数.
        /// </summary>
        public decimal RemainderValue
        {
            private set;
            get;
        }



        /// <summary>
        /// 自动匹配处理.
        /// </summary>
        /// <returns> 匹配后的结果. </returns>
        public List<AutoMatchResult> DoAutoMatchProcess(decimal currentValue)
        {
            // 预期结果.
            List<AutoMatchResult> resultList = new List<AutoMatchResult>();


            // 将 可消耗的商品列表，按照积分大小，  从高到低排序.
            var query =
                from data in BaseDataList
                orderby data.GetExpendValue() descending
                select data;

            // 节余点数 初始值=当前剩余点数
            RemainderValue = currentValue;


            // 遍历 排序后的 可消耗的商品列表.
            foreach (IAutoMatchAble oneItem in query)
            {
                if (RemainderValue >= oneItem.GetExpendValue())
                {
                    // 剩余点数大于  商品需要点数.
                    // 构造结果对象.
                    AutoMatchResult oneResult = new AutoMatchResult();
                    // 唯一关键字.
                    oneResult.ID = oneItem.GetID();
                    // 数量.
                    oneResult.Count = Convert.ToInt32(Math.Truncate(RemainderValue / oneItem.GetExpendValue()));
                    // 单个结果加入 结果列表.
                    resultList.Add(oneResult);

                    // 剩余可用点数
                    RemainderValue = RemainderValue - oneItem.GetExpendValue() * oneResult.Count;
                }

            }


            // 返回.
            return resultList;
        }


    }
}
