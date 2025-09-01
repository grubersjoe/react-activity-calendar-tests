import type { Props } from '../react-activity-calendar/src/components/ActivityCalendar';

export const calendarData = [
  {
    date: '2023-06-01',
    count: 2,
    level: 1,
  },
  {
    date: '2023-07-01',
    count: 16,
    level: 4,
  },
  {
    date: '2024-04-01',
    count: 16,
    level: 3,
  },
];

export const calendarProps: Props = {
  data: calendarData,
  theme: { light: ['#eee', 'magenta'] },
  tooltips: {
    activity: {
      text: (activity) => `${activity.count} activities on ${activity.date}`,
      withArrow: true,
    },
  },
};
