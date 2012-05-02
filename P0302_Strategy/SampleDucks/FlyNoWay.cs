using System;

namespace DesignPatterns.Strategy.Ducks
{

    /// <summary>
    /// ����ģʽ �е� ������Զ���(ConcreteStrategy)
    /// ����װ��ʵ��ͬ�����ܵĲ�ͬ�㷨�� 
    /// </summary>
    public class FlyNoWay : IFlyBehavior
    {
        public FlyNoWay()
        {

        }

        #region IFlyBehavior Members

        public object Fly()
        {
            return "����ɣ�";
        }

        #endregion
    }
}
