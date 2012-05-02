using System;

namespace DesignPatterns.Strategy.Ducks
{

    /// <summary>
    /// ����ģʽ �е� ������Զ���(ConcreteStrategy)
    /// ����װ��ʵ��ͬ�����ܵĲ�ͬ�㷨�� 
    /// </summary>
    public class Quack2 : IQuackBehavior
	{
		public string Quack()
		{
            return "�¸�";
		}
	}
}
