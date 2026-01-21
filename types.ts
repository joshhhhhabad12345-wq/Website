import React from 'react';

export type ViewState = 'home' | 'script' | 'community';

export interface Feature {
  title: string;
  description: string;
  isUpcoming?: boolean;
  icon?: React.ReactNode;
}