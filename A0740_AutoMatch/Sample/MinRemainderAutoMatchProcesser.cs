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
    /// 本类使用 最小节余的算法，  让剩余的点数，尽可能小.
    /// 
    /// 
    /// 
    /// 帐户剩余点数    消耗方式       剩余
    /// 1500            3个C           0
    /// 1400            2个C 1个B      0
    /// 1300            2个C 1个A      0
    /// 1200            1个C 1个B 1个A 0
    /// 1100            1个C 2个A      0
    /// 1000            2个C           0
    /// 900             1个C 1个B      0
    /// 800             1个C 1个A      0
    /// 700             1个B 1个A      0
    /// 600             2个A           0
    /// 500             1个C           0
    /// 400             1个B           0
    /// 300             1个A           0
    /// 200             -              200
    /// 100             -              100
    /// 
    /// </summary>
    public class MinRemainderAutoMatchProcesser : IAutoMatchProcesser
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
        /// 当前最大值.
        /// </summary>
        private decimal currentMaxValue;


        /// <summary>
        /// 最大可能使用的数量
        /// </summary>
        private int[] maxTimesArray;


        /// <summary>
        /// 当前处理索引.
        /// </summary>
        private int[] currentTimesIndex;


        /// <summary>
        /// 最小节余点数.
        /// </summary>
        private decimal minRemainderValue;


        /// <summary>
        /// 最小节余使用次数.
        /// </summary>
        private int[] minRemainderUseTimes;



        /// <summary>
        /// 自动匹配处理.
        /// </summary>
        /// <param name="baseDataList"> 可消耗的商品列表 </param>
        /// <param name="currentValue"> 当前剩余点数 </param>
        /// <returns> 匹配后的结果. </returns>
        public List<AutoMatchResult> DoAutoMatchProcess(decimal currentValue)
        {
            /*
            //  大数字优先的算法
            BiggerFirstAutoMatchProcesser biggerFirstAutoMatchProcesser = new BiggerFirstAutoMatchProcesser()
            {
                 BaseDataList = this.BaseDataList,
            };


            // 预期结果. 首先先用 大数字优先的算法 计算一次.
            List<AutoMatchResult> resultList = biggerFirstAutoMatchProcesser.DoAutoMatchProcess(currentValue);


            if (biggerFirstAutoMatchProcesser.RemainderValue == 0)
            {
                // 如果 大数字优先的算法， 节余已经为 0， 那么就可以直接返回了
                // 不需要再做  “最小节余的算法” 了.
                return resultList;
            }

            if (resultList.Count == 0)
            {
                // 如果 大数字优先的算法， 一行结果也没有， 那么也可以直接返回了.
                // 因为最基本的条件都不满足啊.
                this.RemainderValue = biggerFirstAutoMatchProcesser.RemainderValue;
                return resultList;
            }
            */





            // 下面尝试对数据结果进行调整.
            // 使得剩余点数， 尽可能小.

            // 将 可消耗的商品列表，按照积分大小，  从高到低排序.
            var query =
                from data in BaseDataList
                orderby data.GetExpendValue() descending
                select data;

            BaseDataList = query.ToList();


            // 初始化 当前可用值  与 最小余额.
            this.currentMaxValue = currentValue;
            this.minRemainderValue = currentValue;
            this.RemainderValue = currentValue;

            // 最大可能使用的数量.
            maxTimesArray = new int[this.BaseDataList.Count];

            for (int i = 0; i < maxTimesArray.Count(); i++)
            {
                // 用于存储， 假如积分全部用于购买指定物品， 最多能买几个.
                maxTimesArray[i] = Convert.ToInt32(Math.Truncate(currentValue / this.BaseDataList[i].GetExpendValue()));
            }


            // 初始化 当前处理索引.
            currentTimesIndex = new int[this.BaseDataList.Count];

            // 初始化 最小节余使用次数.
            minRemainderUseTimes = new int[this.BaseDataList.Count];


            


            for (int i = maxTimesArray[0]; i >=0 ; i--)
            {
                currentTimesIndex[0] = i;
                GetMinRemainderValue(1);
            }


            List<AutoMatchResult> resultList = new List<AutoMatchResult>();
            for (int i = 0; i < minRemainderUseTimes.Count(); i++)
            {
                if (minRemainderUseTimes[i] > 0)
                {
                    AutoMatchResult oneResult = new AutoMatchResult();
                    oneResult.ID = BaseDataList[i].GetID();
                    oneResult.Count = minRemainderUseTimes[i];
                    resultList.Add(oneResult);
                    this.RemainderValue = this.minRemainderValue;
                }
            }


            return resultList;
            
        }



        private void GetMinRemainderValue(int itemIndex)
        {
            if (minRemainderValue == 0)
            {
                // 已经完全消耗点，不需要后续计算了.
                return;
            }

            decimal tmpSumValue = 0;
            if (itemIndex == this.BaseDataList.Count - 1)
            {
                // 处理到了最后一层（也就是最后一个商品）
                for (int i = 0; i < currentTimesIndex.Count() - 1; i++)
                {
                    // 计算前面几个 选择 产生的消耗.
                    tmpSumValue += currentTimesIndex[i] * this.BaseDataList[i].GetExpendValue();
                }

                for (int i = 0; i <= maxTimesArray[itemIndex]; i++)
                {
                    // 计算临时剩余数值.
                    decimal tmpRemainderValue =
                        currentMaxValue - (tmpSumValue + i * this.BaseDataList[itemIndex].GetExpendValue());

                    if (tmpRemainderValue < 0)
                    {
                        // 节余小于0了， 可以忽略后续处理了.
                        break;
                    }

                    if (tmpRemainderValue < minRemainderValue)
                    {
                        // 如果当前计算结果，比最小的还要小， 那么设置临时结果.
                        minRemainderUseTimes[itemIndex] = i;
                        for (int j = 0; j < currentTimesIndex.Count()-1; j++)
                        {
                            minRemainderUseTimes[j] = currentTimesIndex[j];
                        }
                        minRemainderValue = tmpRemainderValue;
                    }
                }
            }
            else
            {
                // 还不是最后一个商品， 需要递归处理下一层次.
                for (int i = maxTimesArray[itemIndex]; i >=0 ; i--)
                {
                    currentTimesIndex[itemIndex] = i;
                    GetMinRemainderValue(itemIndex + 1);
                }
            }
        }



    }

}
