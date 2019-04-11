using Quartz;
using Quartz.Impl;
using System;

namespace Quartz1 {
    public class Scheduler
    {
        public void Start(DateTime date)

        {

            IScheduler scheduler = StdSchedulerFactory.GetDefaultScheduler();
            scheduler.Start();
            IJobDetail job = JobBuilder.Create<TwilioObj>().Build();
            ITrigger trigger = TriggerBuilder.Create()
             .WithDailyTimeIntervalSchedule
              (s =>
                  s.WithIntervalInHours(24)
                  .OnEveryDay()
                  .StartingDailyAt(TimeOfDay.HourAndMinuteOfDay(23, 40))
                
              )
             .Build();
            System.Diagnostics.Debug.WriteLine("hjbjkbey");
            scheduler.ScheduleJob(job, trigger);
        }

    }
}
