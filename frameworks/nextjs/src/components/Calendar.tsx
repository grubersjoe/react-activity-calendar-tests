// Note: This must be a client component to support tooltips, since props
// passed from server to client components must be serializable. The tooltip
// callback functions cannot be serialized, so they can only be passed in
// client components.
'use client';

import { ActivityCalendar } from 'react-activity-calendar';
import 'react-activity-calendar/tooltips.css';
import { calendarData } from '../../../config';

export function Calendar() {
  return (
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
  );
}
