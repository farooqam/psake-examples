using System;

namespace NetCoreConsoleApp
{
    internal class ConsoleOutputPort : IOutputPort
    {
        public void WriteLine(string s)
        {
            Console.WriteLine(s);
        }
    }
}