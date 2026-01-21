import React from 'react';
import { Shield, Zap, Infinity as InfinityIcon, MousePointerClick, ChevronRight, Bot } from 'lucide-react';
import { Button } from './ui/Button';

interface HomeViewProps {
  onNext: () => void;
}

export const HomeView: React.FC<HomeViewProps> = ({ onNext }) => {
  return (
    <div className="flex flex-col items-center justify-center min-h-[80vh] px-4 animate-in fade-in slide-in-from-bottom-8 duration-700">
      
      {/* Hero Header */}
      <div className="text-center mb-16 relative">
        <h1 className="text-7xl md:text-9xl font-bold tracking-tighter text-transparent bg-clip-text bg-gradient-to-b from-white via-red-100 to-gray-400 drop-shadow-[0_0_25px_rgba(220,0,0,0.6)] font-sans">
          PROJECT X
        </h1>
        <div className="h-1 w-full bg-gradient-to-r from-transparent via-blood-500 to-transparent mt-2 shadow-[0_0_15px_#ff0000]" />
        <p className="mt-6 text-xl md:text-2xl text-gray-300 font-light tracking-[0.2em] uppercase">
          The Ultimate <span className="text-blood-500 font-bold drop-shadow-[0_0_5px_#ff0000]">Advantage</span>
        </p>
      </div>

      {/* Features Grid */}
      <div className="grid grid-cols-1 md:grid-cols-2 lg:grid-cols-4 gap-6 max-w-7xl w-full mb-16">
        <FeatureCard 
          icon={Shield}
          title="Auto Parry"
          description="Advanced algorithms that deflect attacks with millisecond precision. Never miss a block again."
          active
        />
        <FeatureCard 
          icon={InfinityIcon}
          title="Infinite Parry"
          description="Removes parry cooldown entirely. Become untouchable in the arena."
          upcoming
        />
        <FeatureCard 
          icon={Zap}
          title="No Dash CD"
          description="Eliminate dash cooldowns for limitless mobility and positioning advantage."
          upcoming
        />
        <FeatureCard 
          icon={MousePointerClick}
          title="Auto Spam"
          description="Intelligent attack spamming to overwhelm opponents instantly."
          active
        />
        <FeatureCard 
          icon={Bot}
          title="Smart AI Move"
          description="Automatically walks you to the intermission zone and readies up for the next round."
          active
        />
      </div>

      <Button onClick={onNext} variant="primary" glowing className="text-xl px-12 py-4" icon={ChevronRight}>
        Get The Script
      </Button>
    </div>
  );
};

const FeatureCard: React.FC<{ 
  title: string; 
  description: string; 
  active?: boolean; 
  upcoming?: boolean;
  icon: React.ElementType;
}> = ({ title, description, active, upcoming, icon: Icon }) => (
  <div className={`
    relative group p-6 border rounded-sm transition-all duration-300 backdrop-blur-sm
    ${upcoming ? 'border-zinc-800 bg-zinc-900/30' : 'border-blood-900/50 bg-black/40 hover:border-blood-500 hover:bg-blood-900/10 hover:shadow-[0_0_20px_rgba(255,0,0,0.2)]'}
  `}>
    {upcoming && (
      <span className="absolute -top-3 right-4 px-2 py-0.5 bg-zinc-800 border border-zinc-700 text-zinc-400 text-xs uppercase tracking-wider font-bold rounded-sm">
        Next Update
      </span>
    )}
    {active && (
      <span className="absolute -top-3 right-4 px-2 py-0.5 bg-blood-900 border border-blood-500 text-white text-xs uppercase tracking-wider font-bold rounded-sm shadow-[0_0_10px_#ff0000]">
        Live
      </span>
    )}
    
    <div className={`mb-4 p-3 inline-block rounded-full ${upcoming ? 'bg-zinc-800 text-zinc-500' : 'bg-blood-900/20 text-blood-500 group-hover:text-white group-hover:bg-blood-600 transition-colors'}`}>
      <Icon className="w-8 h-8" />
    </div>
    
    <h3 className={`text-2xl font-bold mb-2 uppercase font-sans ${upcoming ? 'text-gray-500' : 'text-white'}`}>
      {title}
    </h3>
    <p className={`text-sm leading-relaxed ${upcoming ? 'text-gray-600' : 'text-gray-400'}`}>
      {description}
    </p>
  </div>
);