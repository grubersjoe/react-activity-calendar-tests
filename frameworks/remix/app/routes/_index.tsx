import { ActivityCalendar } from 'react-activity-calendar';
import 'react-activity-calendar/tooltips.css';
import { calendarData } from '../../../config';

export default function Index() {
  return (
    <>
      <h3>Remix</h3>
      <ActivityCalendar
        data={calendarData}
        theme={{ light: ['#eee', 'violet'] }}
        tooltips={{
          activity: {
            text: (activity) =>
              `${activity.count} activities on ${activity.date}`,
            withArrow: true,
          },
        }}
      />
    </>
  );
}
