import React from 'react';
import { Heart, Share2, ExternalLink } from 'lucide-react';
import { Button } from './ui/Button';

const DiscordIcon = ({ className }: { className?: string }) => (
  <svg 
    viewBox="0 0 24 24" 
    fill="currentColor" 
    className={className}
  >
    <path d="M20.317 4.37a19.791 19.791 0 0 0-4.885-1.515a.074.074 0 0 0-.079.037c-.21.375-.444.864-.608 1.25a18.27 18.27 0 0 0-5.487 0a12.64 12.64 0 0 0-.617-1.25a.077.077 0 0 0-.079-.037A19.736 19.736 0 0 0 3.677 4.37a.07.07 0 0 0-.032.027C.533 9.046-.32 13.58.099 18.057a.082.082 0 0 0 .031.057a19.9 19.9 0 0 0 5.993 3.03a.078.078 0 0 0 .084-.028a14.09 14.09 0 0 0 1.226-1.994a.076.076 0 0 0-.041-.106a13.107 13.107 0 0 1-1.872-.892a.077.077 0 0 1-.008-.128a10.2 10.2 0 0 0 .372-.292a.074.074 0 0 1 .077-.01c3.928 1.793 8.18 1.793 12.062 0a.074.074 0 0 1 .078.01c.12.098.246.198.373.292a.077.077 0 0 1-.006.127a12.299 12.299 0 0 1-1.873.892a.077.077 0 0 0-.041.107c.36.698.772 1.362 1.225 1.993a.076.076 0 0 0 .084.028a19.839 19.839 0 0 0 6.002-3.03a.077.077 0 0 0 .032-.054c.5-5.177-.838-9.674-3.549-13.66a.061.061 0 0 0-.031-.03zM8.02 15.33c-1.183 0-2.157-1.085-2.157-2.419c0-1.333.956-2.419 2.157-2.419c1.21 0 2.176 1.086 2.157 2.419c0 1.334-.956 2.419-2.157 2.419zm7.975 0c-1.183 0-2.157-1.085-2.157-2.419c0-1.333.955-2.419 2.157-2.419c1.21 0 2.176 1.086 2.157 2.419c0 1.334-.946 2.419-2.157 2.419z"/>
  </svg>
);

export const CommunityView: React.FC = () => {
  return (
    <div className="flex flex-col items-center justify-center min-h-[80vh] px-4 animate-in fade-in slide-in-from-right-8 duration-700 w-full max-w-5xl mx-auto">
      
      <div className="text-center mb-16">
        <h2 className="text-5xl md:text-7xl font-bold mb-6 font-sans text-white uppercase tracking-tighter drop-shadow-[0_0_15px_#ff0000]">
          Join The <span className="text-blood-500">Empire</span>
        </h2>
        <p className="text-gray-400 text-xl max-w-2xl mx-auto font-light">
          Stay updated with the latest scripts, giveaways, and community events. Support us to keep Project X free and premium.
        </p>
      </div>

      <div className="grid grid-cols-1 md:grid-cols-2 gap-8 w-full">
        
        {/* Discord Card */}
        <div className="group relative bg-[#5865F2]/10 border border-[#5865F2]/30 p-8 rounded-lg overflow-hidden hover:bg-[#5865F2]/20 transition-all duration-300 hover:border-[#5865F2] hover:shadow-[0_0_30px_rgba(88,101,242,0.4)] flex flex-col items-center text-center">
          <div className="absolute top-0 right-0 p-4 opacity-10 group-hover:opacity-20 transition-opacity">
            <DiscordIcon className="w-32 h-32" />
          </div>
          
          <div className="bg-[#5865F2] p-4 rounded-full mb-6 shadow-lg shadow-[#5865F2]/50 group-hover:scale-110 transition-transform duration-300">
            <DiscordIcon className="w-10 h-10 text-white" />
          </div>
          
          <h3 className="text-3xl font-bold text-white mb-2 font-sans">DISCORD</h3>
          <p className="text-blue-200 mb-8 z-10">
            Join the hub for support, updates, and community chats. Help us grow by inviting your friends!
          </p>
          
          <a href="https://discord.gg/projectxhub" target="_blank" rel="noopener noreferrer" className="w-full z-10">
            <Button className="w-full bg-[#5865F2] border-[#5865F2] hover:bg-[#4752c4] hover:shadow-[0_0_20px_#5865F2]" icon={ExternalLink}>
              Join Server
            </Button>
          </a>
        </div>

        {/* TikTok Card */}
        <div className="group relative bg-zinc-900/50 border border-pink-500/30 p-8 rounded-lg overflow-hidden hover:bg-zinc-900/80 transition-all duration-300 hover:border-pink-500 hover:shadow-[0_0_30px_rgba(236,72,153,0.4)] flex flex-col items-center text-center">
          <div className="absolute top-0 right-0 p-4 opacity-10 group-hover:opacity-20 transition-opacity">
            <Share2 className="w-32 h-32" />
          </div>

          <div className="bg-gradient-to-br from-cyan-400 to-pink-500 p-4 rounded-full mb-6 shadow-lg shadow-pink-500/50 group-hover:scale-110 transition-transform duration-300">
            <svg viewBox="0 0 24 24" fill="currentColor" className="w-10 h-10 text-white">
              <path d="M19.59 6.69a4.83 4.83 0 0 1-3.77-4.25V2h-3.45v13.67a2.89 2.89 0 0 1-5.2 1.74 2.89 2.89 0 0 1 2.31-4.64 2.93 2.93 0 0 1 .88.13V9.4a6.84 6.84 0 0 0-1-.05A6.33 6.33 0 0 0 5 20.1a6.34 6.34 0 0 0 10.86-4.43v-7a8.16 8.16 0 0 0 4.77 1.52v-3.4a4.85 4.85 0 0 1-1-.1z" />
            </svg>
          </div>
          
          <h3 className="text-3xl font-bold text-white mb-2 font-sans">TIKTOK</h3>
          <p className="text-pink-200 mb-8 z-10">
            Follow @useprojectx for showcases, tutorials, and sneak peeks. Support our content!
          </p>
          
          <a href="https://www.tiktok.com/@useprojectx" target="_blank" rel="noopener noreferrer" className="w-full z-10">
            <Button className="w-full bg-black border-pink-500 hover:bg-zinc-900 hover:shadow-[0_0_20px_#ec4899]" icon={Heart}>
              Follow Us
            </Button>
          </a>
        </div>
      </div>

    </div>
  );
};